Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330BBEE0219
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxhNroXWS2q4E94rJ0da/EOpMT3bn/I4XrSDv4KWYO0=; b=3AHGQJCHC0tXoDhrbw0cmvpCvr
	qjQCHfXQlv0Or20IHyrSupmATrpoHcdjc8Bfp0JPQFAj0hiIOC0uCBsA/qt27o+bp23I5d98nR/yC
	Qz5aXdz06xsccsck6lWw5VnKY9sBO48O895QfRrUDLy7gYo6qqOqHOkbX7Y0woE9W9hPY8L3U8I/Z
	ELE69/pWRziklOj1FMb3X1xvq+zKBmxWZrf4meQTPo88jKb2OjgE7pknCsiFpqgaQ8R0w3aTc98fB
	hqmGZTLwoSwIv1dSrulSC07eee4wZqd//C1QpI0e2bLFrzp561rac86fIZqcmwkgSW3oksXspD1tM
	SY+/UFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soIiY-00000008eU7-3rpK;
	Wed, 11 Sep 2024 08:28:50 +0000
Received: from a7-44.smtp-out.eu-west-1.amazonses.com ([54.240.7.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soIfK-00000008dhK-3pPm;
	Wed, 11 Sep 2024 08:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726043126;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=s63kZ6TAqCQ+zyauVVJwA7gnFvBuDWuKf1o6iwJAeGI=;
	b=PbJ8JW+67bU2vYYrsNXZQ2wWdgwSIZrAmELpA+gz+IHito2uHaQivkbxr1a/O8ja
	2LdaI4W+n7jy7eA/CpJ6vq8GpicqyEvyZXMMBK2OQPV3lAN5qMVL8DBQeIopLpzxTQX
	VLcBNazMBGJF4+Bdahm6q+mjs1NNS6nnZzAR1DI89T4q2OAYsysWroUqS9pD/2uspU9
	NDnp3U+hdA9g+P2ay/AYoA+0wk9zkzF97Ma4jahEv+qjC1d6CqprZ9rDRJYOd7fXp7I
	2fPUCzvQPfmJJENhQJs4x9aQETp6fy4x+l+6x8Tx7ofvyQ9NfLW0GMEsTjI6huxGy5X
	NfBkYt1pKQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726043126;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=s63kZ6TAqCQ+zyauVVJwA7gnFvBuDWuKf1o6iwJAeGI=;
	b=CbsBsdmBTTYE6i5ElDN3ywZR35E5JhFiSS6ucFzLV+VV7O11vva6ktAExi+tIGd1
	UUrKRZzRgz8b1+fi368dvp1pIqu6opaTCXPrUW+xwTHg+2v9MOXx9N/breJIdTFB00e
	xT8orsj53uBVVhBnur3pCaD2R+N550ImUu+3WGS4=
Message-ID: <01020191e02ffa5a-26aca14f-dede-4675-a177-92a1e3b5a27a-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 08:25:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] wifi: mt76: mt7615: Convert comma to semicolon
To: Shen Lichuan <shenlichuan@vivo.com>, nbd@nbd.name, lorenzo@kernel.org, 
	ryder.lee@mediatek.com, kvalo@kernel.org, matthias.bgg@gmail.com
Cc: shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, opensource.kernel@vivo.com
References: <20240911034243.31596-1-shenlichuan@vivo.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911034243.31596-1-shenlichuan@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.44
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_012531_132804_FF20A3C0 
X-CRM114-Status: UNSURE (   5.12  )
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

Il 11/09/24 05:42, Shen Lichuan ha scritto:
> To ensure code clarity and prevent potential errors, it's advisable
> to employ the ';' as a statement separator, except when ',' are
> intentionally used for specific purposes.
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



