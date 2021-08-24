Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28784C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 10:25:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77206127B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 10:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E77206127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Vt257G01v/7TVyclmDFNj1cqdsJLJQpx4VweKrWRDQ=; b=XZFA/rdfWcjIw0
	qMb+6PWznjfEQ+E8WWPYu1etJgHoFEKT7WCdaAM2iZPie+tUPFFXDGc14U35dTGxdeF7/tMki2EVE
	PswCS0wfMjrd6VW/mbaumrcruR4DVV/TubqJceJDoKPuFN0LN+QkEeqT7IXoH/jus+D7c1takr1iq
	3j7DITEPeDVxeGelXOwiyRZ1fRNzM8Ar3r9emzssLC+RN71DfseqNNxnTD7+zZFP80oyYCXxLRdyz
	VM1OD3Ko273b2sPV2o7VQQO5f+Tb3AEJKWinfahJd65/IvzI0Eck/mbk35wAVLSeJPrOO7bgJ98l7
	4kql1vyWqA3r8M352PJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mITc9-002W8R-AY; Tue, 24 Aug 2021 10:25:05 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mITbj-002W0V-2T
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 10:24:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id r9so1873253pfh.6
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0qA56lHF3PwgnWhkGOpQMcKDSscYjYL3TjQAdBAX2/E=;
 b=OYnUiU/nZmeU0kxrvNOScIJXtl6UXKmEuHbCq+uUf/AaRlVOFYyPn8ZpWBlbAk03qf
 AWQn/KhHq2S+LPMjBjduQ23fXGF+EJkPXMcFA+fxywJvS5cbQxrWE5fscdRhAqXBMn0/
 5k89WPs/NQ1MQqNFO0ugGgczcAtrlsYl43MjFYBa/YNGtrNSd49sRavTBW4DroLx/vaq
 9DuqBb+VvkH002neoLOckr6Uj2DfKJVpLztKc6dp9sGD6NJx8xIDil+Fk3ygymcD7SZO
 OADRVjJy1WqyoiN6+hF6CZDJpCXW+apXn/ASYJt/UpN/Y8hMNX66Dc7T+IGB7WoKdQVA
 zvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0qA56lHF3PwgnWhkGOpQMcKDSscYjYL3TjQAdBAX2/E=;
 b=mVRrTsTm2jICvAyKZIJLkUsfVU2HIf0Sf7HJrc8LhtvWgTmNfHcXJXWy0Fd/Gb0BjP
 aq6tbLJ3zCjwEO/sKGRDbcRIVerjN5yldtl8TSKlUNFMkNGt8kfwbrMj+ftPAfyjIXPR
 sLxWEFgDnUV5l9hCN6jPCAgjlyDqfQexdMY9ihskE+yu7ASbhEknDHy+VySZaw82ifMP
 O7+NYKVdUBzua884Rs2vOTGta8n1YOY8kj8NlEpfOAogPxE6+OaoQ/J2RBd19ai1bghJ
 S/tLw6LTR+8T5FsOJnoXjAkQovdK9cJm2YXtzA3ni7Vvs9XZQRla9B678ktThX2br6C/
 6PRQ==
X-Gm-Message-State: AOAM533ddR3zvYQ2gVUmI6slmmmp+EcjvrPpbOjhIvlg+0eOIapJCAHE
 bSvggIuvu+Ea9Ccxw5vE0trIwA==
X-Google-Smtp-Source: ABdhPJx0BkDDUlgCq7OTq0mI4s8vnsDq/uQELrkK4Koz1nMo01Uh/2XJzFlKLwlaBNIVBif110OJWA==
X-Received: by 2002:a63:e70f:: with SMTP id b15mr36824531pgi.182.1629800674814; 
 Tue, 24 Aug 2021 03:24:34 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:4a93:46f4:da9a:4371])
 by smtp.gmail.com with ESMTPSA id r78sm19381040pfc.206.2021.08.24.03.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 03:24:34 -0700 (PDT)
Date: Tue, 24 Aug 2021 18:24:29 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 5/9] media: mtk-vcodec: Rewrite venc clock interface
Message-ID: <YSTI3QjTnGZEgwOM@google.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-6-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-6-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_032439_255377_979EE72C 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 16, 2021 at 06:59:30PM +0800, Irui Wang wrote:
> -void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
> +void mtk_vcodec_enc_clock_on(struct mtk_vcodec_dev *dev, int core_id)
>  {
> -	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
> -	int ret, i = 0;
> +	struct mtk_venc_comp_dev *venc;
> +	struct mtk_vcodec_pm *enc_pm;
> +	struct mtk_vcodec_clk *enc_clk;
> +	struct clk		*clk;
To be neat, remove the extra spaces.

> -	ret = mtk_smi_larb_get(pm->larbvenc);
> -	if (ret) {
> -		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> -		goto clkerr;
I may miss the context but why does it remove mtk_smi_larb_get()?

> -void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
> +void mtk_vcodec_enc_clock_off(struct mtk_vcodec_dev *dev, int core_id)
>  {
> -	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
> -	int i = 0;
> +	struct mtk_venc_comp_dev *venc;
> +	struct mtk_vcodec_pm *enc_pm;
> +	struct mtk_vcodec_clk *enc_clk;
> +	int i;
>  
> -	mtk_smi_larb_put(pm->larbvenc);
Same here.  Why does it remove mtk_smi_larb_put()?

>  int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev)
>  {
>  	int i, ret;
>  	struct mtk_venc_comp_dev *venc_comp;
> +	struct mtk_vcodec_clk *enc_clk;
> +	int j = 0;
It doesn't need to be initialized.  Can inline to "int i, ret;".

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
