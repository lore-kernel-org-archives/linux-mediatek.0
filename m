Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8BDEE4998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSecsePV+6Ky6ujrg3mCMO7iYBL4LlKC8zFwO3vRa5c=; b=vo9Jc30w1l27tCnT59RvK+0PM6
	yiqvyIoE0z6aB0ZSm3nyiH8GLjKSmhWOZ4/eAPgKq4J29Q9e2XBHSPKz8jjHReuvL0Q6PEWk8N8QX
	BRq3jQlouvXJKYxU1RDiQQAIlAaHXcuYbuvKxzy3f/k4STA4+uv9sSNSne8m/+mLuKT2obcgjOgR0
	c0aX/Ef0ZLDlbc/EuJZ2m6gG28QZud32lmQwTev61PRH9bNZUFOklQmWs5zcKr4cwp6JqqpGWCcug
	RI+zTQEQDg1LmyvJlOGdFFBdSIS9k0NAkESaiduisXNThelGGLb7YPZVWN9QEV9NYcDQqyhpFIKaS
	j9f2rlLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLWT-00000009ID7-1kA0;
	Wed, 11 Sep 2024 11:28:33 +0000
Received: from a7-46.smtp-out.eu-west-1.amazonses.com ([54.240.7.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLT4-00000009HYM-0eGV;
	Wed, 11 Sep 2024 11:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726053898;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0OC+2f4WWQUaEAQekYa+3Ctje3AZxE3EHaRKKI/Ddfg=;
	b=NC4kYUPCo/weRsJso17p/pDwyMJ6kGym9YUyk1miZC4vUaGcRpQTflLBSUG48O10
	27lodhusyHxd4MWVOKr/0nB0iEVS7k/zh6VzNv8D9sdasrCuae1I3gVEeyi3FtJQtE3
	gq7hlF2OcxUs2i6R2vYszPqPlbrMw/bxzFw0mZlRamrNR13iTellRCbWuwnT0rh8nDT
	cIyG4o7b8Di0q6xIecjGTpTq36Pu+YBBKjnuXWE2ckW4Sn66u7tHhArqtaZ/kKgcSI4
	TAjbG8/LN2LA9w2NCk6JWcroMQytcANmvxg1v4y/cA4Qaz5dN0yfH9e3ddSRVWbSMN4
	jWkq+FpxOA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726053898;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=0OC+2f4WWQUaEAQekYa+3Ctje3AZxE3EHaRKKI/Ddfg=;
	b=F+LbNxgli/3i8+Mjnnavv3bhnZDNlPAYplFiCntaHPYtOHrYuMeBoRLP5In7gH97
	JKqqRNpsmqIV0fNU0+y2hPmUq/CpFkT59mc1JTYyomsvi3XUkdaayGJcCisCgRCgB2x
	efRqmRE8iG18hI30aTkCBHNCO1by1ylyu/qYKTw0=
Message-ID: <01020191e0d4570b-2178f43c-6912-4722-a0c4-41560dd73643-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 11:24:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: mailbox: mtk,adsp-mbox: Add
 compatible for MT8188
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
References: <20240911105131.4094027-1-fshao@chromium.org>
 <20240911105131.4094027-3-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911105131.4094027-3-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.46
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_042502_678269_5CD45F8C 
X-CRM114-Status: UNSURE (   6.02  )
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

Il 11/09/24 12:51, Fei Shao ha scritto:
> Add compatible string for ADSP mailbox on MT8188 SoC, which is
> compatible with the one used on MT8186.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



