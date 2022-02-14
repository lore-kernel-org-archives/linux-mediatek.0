Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDB9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MARzXCIGcDBvVZI8yLf/wIuMpEPMBPjv91qAjtraVU=; b=BZNZpynqKN5kHd
	osmjg1ptgwelDnz07Ywfpbz6jZfdtDV3vlLMwSI+rz3uVWBYFBh5v5rfoYuRfM6UO1nzESgO7fNK5
	uwbXpxwF79CTlpQPHi4KjpA+Rs5F4pFoVtGUFYb/ofrrI3sJudfiEZwA184V8wLCOMs18x/jbG4rh
	yYQFvs4o4WwNrU/54y9D2cE6ShwHEQLTp9+vYXRTUNPiWCVjH1oQITIUCHIhV0PtWmeOptg2rIrM/
	K4To2aWEuRnjDh3cEZ1qjTvrfnsnKXY523y0MCHk1viGKSv85oLeKf3c//rQfJrAQGcyCM45OxiKQ
	RDRFyGnZPyIBvVPNDXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbaR-00FSJF-FY; Mon, 14 Feb 2022 13:40:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbaD-00FSBQ-CN
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 13:40:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so10224402wmq.3
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rMeJGTPLV4p5Tp7DaVbfqVcY08kZOJPbVdTXvGtRNBc=;
 b=aTQvC94T+4hLmbUP5ne+1nnxGO5slFq/CcjZI53DJsx12d9mFc9B+m6jrQG89VZBWr
 Q00Io8p1gyLzlk6LFKMN1bfDB0FwT7QcsNPOoww7eU3PbhlsGGNVIyVn5FaSIJtu3/fQ
 OwgIqecL3sadqGvoyNpHaoP6FbyT8gyZY8tBbCWBO6dJWIBYhBE+3amKT+CpXoUi/7Ve
 icUFYEQjnid26p21bDAYZN/Yv7S5tdAGTpAsqOw1N7aPSSRTdjFBNgwg1MAy2g1cFDDs
 YoSrtrJZQV6y/cSVTPa6mjHEHP/2s1XlcJOkPQp9lpLbX/WPlxd93pLvoLkLmatCJxW+
 PpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rMeJGTPLV4p5Tp7DaVbfqVcY08kZOJPbVdTXvGtRNBc=;
 b=kQAiT8EMafGPKG+tPcAbrF4eNVm6baSLOC/sE0FLbS1vfbNEMXDKlvVz0pFwbYOzW1
 pvWvxr1Oxcmv/v7VST9maQvnfLl4sxWWMeonFJAIfi8J6AW7TmTsP8z2ct1TdlGhZC/z
 23PaBwBRwK8omhLooxThrHj1mrF6Spp8Sv0UAfyujcZMxlOzAU/1QP1YGsHyYai5xQq+
 hhofaNyd1tNiWC88rpuqkUwwPGsqJbR9rFQQvE1S1BdDUx6ztFHKor/gJfGkt8mcqRYt
 u14BL1SVlOSJo4Kc8efsyLt+l/d/ngYHQisgncM7rFoAUBLUwJKYvVxoPkkKADDZLDpI
 6FWA==
X-Gm-Message-State: AOAM530K1+8VaKGcpDAC7KKXnc+fzH4nkmz+clTk6/SUjnXc4EafENlx
 brqKUpj0J9ySYUuCkWh+e6EHCg==
X-Google-Smtp-Source: ABdhPJyDZTKnKIpflWM8nlDBTCK9MeSmS3Ct60VsMMPiP3Dsw91w5J79nOlLruKTTROA4E2LwFGqog==
X-Received: by 2002:a05:600c:3c89:: with SMTP id
 bg9mr11215826wmb.194.1644845999574; 
 Mon, 14 Feb 2022 05:39:59 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id y6sm3577479wrd.30.2022.02.14.05.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:39:59 -0800 (PST)
Date: Mon, 14 Feb 2022 13:39:57 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: robh+dt@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 3/4] dt-bindings: mfd: Add compatible for the MediaTek
 MT6366 PMIC
Message-ID: <YgpbrWEwCtCQlez+@google.com>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-4-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106065407.16036-4-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_054001_449004_79A867BE 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwNiBKYW4gMjAyMiwgSm9obnNvbiBXYW5nIHdyb3RlOgoKPiBUaGlzIGFkZHMgY29t
cGF0aWJsZSBmb3IgdGhlIE1lZGlhVGVrIE1UNjM2NiBQTUlDLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEpvaG5zb24gV2FuZyA8am9obnNvbi53YW5nQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9tdDYzOTcudHh0IHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQsIHRoYW5r
cy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KUHJpbmNpcGFsIFRlY2huaWNhbCBMZWFkIC0g
RGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
