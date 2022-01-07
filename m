Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ConR+DTElq7iqaeehkNR6Nzz5z+wAsrlnBdn/HyePxA=; b=aJUp1U7oFb2n+06/SwvdZpUG5J
	+c0PZHbXVonSTA7ZWNyXvep+6DcKWVyikU97m2iVg6cl6xrxBemzsUi1FMJVLXRZUdB4C2BqLWViG
	khMuJnxTMvY8NORXuhrqL1O+9AVzqIg8WOkYdZvfDCOIJoIOIdOiuQeQf3YrdWXAWoC2Ilob+Hxoe
	Q7s6WWGTdXTv795aHplyuLorqeM/BPUnZmvYB0qqjXzHR4l2JsDq4j/cU/H/UESpndHc+gz3FFokv
	lFBRBscFQivoPMdy9b9JJsvhcdB35WwcxaLG5d3pJYDoGHhfRHTSeACYX7xawud5sfijIl9N17AOU
	QdOP3yrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5nA2-003aEW-5o; Fri, 07 Jan 2022 11:11:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5n9q-003a8w-Dv; Fri, 07 Jan 2022 11:11:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 65FFB1F4612E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641553900;
 bh=m721BsZbFnwbyKTfgTE6FG/GfOsUbk7x/oEzoiDf2p8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GqCxgkc8ru3/o/e+RSltleF5YGSGOijErpc/QDaRcwK6M+3PfMpqIZhusMsFAA7IA
 mbWVKPY166AyxheLsMy2FxMH306niyr3ZC/RrBouMGx5WQwuXFwmUsEJ95S8nObhBE
 cuV3rr2xPhOaFwNay2omUIwUICls36U3tuDv/FiFUOpxtRQJAxLBqWX0jKP4ylO2EA
 1F0RjyzTNjH6VqBHj62+kb/QTWx24Ql4sADV0h9kW22J0OCQQ5o8Q2ppMfMiB675kp
 kZlHs3OHzm16QEMV3pqvRdxCFzBNExf0lgQzNsbJfvlA6nClKpSNO2IebqQqW8E3u9
 l0yiv8lDg2U6A==
Subject: Re: [PATCH v2 1/2] soc: mediatek: pwrap: add pwrap driver for MT8186
 SoC
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220107104633.7500-1-johnson.wang@mediatek.com>
 <20220107104633.7500-2-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b487865f-086e-9463-a698-82f14c42ff23@collabora.com>
Date: Fri, 7 Jan 2022 12:11:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220107104633.7500-2-johnson.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_031142_673756_02AABDDD 
X-CRM114-Status: UNSURE (   9.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/01/22 11:46, Johnson Wang ha scritto:
> MT8186 are highly integrated SoC and use PMIC_MT6366 for
> power management. This patch adds pwrap master driver to
> access PMIC_MT6366.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
