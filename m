Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868DAECE582
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAC62WFQ6wvNQLTlkGRQv8EInybhZ4k6L6E0MPUTbWY=; b=i2CRKAgTGcRGjqLABNg1rAX5E6
	ikTfedPD2e9MIKo+vfbv54qP3fYQwOf9p4yCO6Rgc+7oEEsJN9eXsS6KzmRpfPO28bxjizFl4GHLF
	AsZgGn4dsbNB3mjL0EyBhhB7I8MUUjgkgfIg4uxpY7IbnACRcWSn4fnU3YFoNmDtN+A9MOBkXqNQ0
	JJMDflopA0WthVpYokMmUnEtogc9hj3h5fTQUKBMhr7PYQvdStwllPPm2zyUc6crMvAswLTyEXdnt
	t/9pf62TEBifmF18k9UW4KLpQVX8zctD2ehMmk6BTQ5WGTcDrDbpgE87d5zWREX8GbRwK2i/PYzSE
	+ppuLaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwu5-00000004x6D-0QFg;
	Tue, 10 Sep 2024 09:11:17 +0000
Received: from a7-47.smtp-out.eu-west-1.amazonses.com ([54.240.7.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwr4-00000004wLS-3sRI;
	Tue, 10 Sep 2024 09:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725959287;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ap9MOG3CXdyjhNIqu9RwhMWZU+OT3wDOHRUFW/Y/OMw=;
	b=bCFRAajkH6DO7bl5wHG4/onrjBY8MayVa4VwIdFXeivR5gIlM7Qwj1mU9wSIvYmg
	JX/DBrFbJDPEC8pOB545qmg8GxtY4NLmN4ts0zJxwastvsMjOsfsXSUoCFl2PBpduOq
	2H9wSeovCX98GhUBVlQdJxzaWvvdVYaE560lrWj6pSf9byg48cAmWwZpiqP8lL81uAs
	o0jPe76Vx59Sr1YacP8nCjBG9oE5Mb/0oWUCfj52j5kyGahEyv6mLwqSNoU40pv7PBd
	yBlYUkxChphFVmlZpASkdbOZ4obtxwA3WlsWOb79GuD7C/HkZZNyKk1zMYtlqo91clo
	iiwKJZF/mg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725959287;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=Ap9MOG3CXdyjhNIqu9RwhMWZU+OT3wDOHRUFW/Y/OMw=;
	b=bFEm71YY9eP7DZF1XyG/d/vJz3Pcn7pBRgeBbCt0UegboODNJEqdvwwmvyBvRogB
	RonFXUoCnx84EdsiwVOUXZM/hx7P3FWSSLRcTI/b6RO5Y1MPGbPi+2jkFdbfC9/SHm5
	4zoohbdaEEfij58aw8CAosYYEsoGSAh8dYI0txvM=
Message-ID: <01020191db30b13f-7c843665-0c84-40d2-ac68-6f21dac57bbd-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:08:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: platform: mtk-mdp3: Use cmdq_pkt_write when no
 mask is needed
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
 <20240823-mdp3-comp-cleanups-v1-1-1f8c1395ecd3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-1-1f8c1395ecd3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.47
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_020811_142504_6FC1B212 
X-CRM114-Status: UNSURE (   5.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/08/24 23:31, Nícolas F. R. A. Prado ha scritto:
> cmdq_pkt_write_mask() boils down to a cmdq_pkt_write() when the mask is
> 0xFFFFFFFF. Call cmdq_pkt_write() directly in those cases to simplify
> the code.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



