Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B288C433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:18:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0BAF20809
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:18:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e1vqca5T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IMFfBxmD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0BAF20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vl2hPWA5VqPxlrmi6+6oPXzi+7bc51wfwgxEs5Y7FTA=; b=e1vqca5TjMlRvKdfSikcq8m0C
	GVRf05Zd8XbipwiAEyteOcStDeN4TvV9o+H7wp8dQJiXy9Ltd91E2++52ofxSQWAH4b8+FKiYw1yH
	run5k/mxm9vnU5g0J+fsUroGZP5HWd6Xc6nj4enzo0gKucOzNmBLRAjbwDwalPsMpI2YmCXuddzXe
	/MvzlCc9b43hX0y3cCdebBXz/DDPB94cu0Yqu8CndEeiWaY0/zmgq9oPCXtpaDBIWOOsebGP3t1I8
	INB0W7GT4dm5o5cfF73Vm5qSWz279+xMI3OjTsqarP9l0Biz4UiPplIdGotp3XPt/Idf1kN+Ysb1l
	2llMGanPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k018z-0002ze-2b; Mon, 27 Jul 2020 11:18:09 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k018w-0002z0-PT
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 11:18:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id t142so7996937wmt.4
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 04:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ayi/e4qc8xsetgggFV1hGFKG2SY4MV5HUyFO2Mns7hA=;
 b=IMFfBxmDH9GeAp56UoH+TgHOtCIiUsNZQlRMuhPNR2+G6Zwp86/9MbqRT+5hTh47xv
 R9nBTL76EFjq8v3PQdXQ0BidZgDDDJOAO1RAflVBpHaJsdVlwtAf1SRZEqxZEtS6YQfr
 LxaCTVein0aWx2Gs87EjEy7GjkU5SePER0v9mjKisrOTw7hP7N2ytuez5fqEtSNfAb5G
 p6y1zLl2xVbkI5RL24b/psWd2L6OgSv0BxL45jKKat7HmncnEncoIzsv4fT+Wpw5Bl1g
 RwfIdJiw9oP9BBTbluqBzUnqTx9hWD3krEiuxhQWrxWo0r9bk3fkBTlwPqVG9R6p4ivg
 4Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ayi/e4qc8xsetgggFV1hGFKG2SY4MV5HUyFO2Mns7hA=;
 b=Yofd1wmnj5G4/qD3y7Ef6No6YoTMtDEvSXaGOC6Ckgg7rIaTS+EgSkDMsw1pEVmBXq
 u0EnIVSwqrbVqzKq1Qazx0GmRXXz8yfJY4o4gfhV2UCpRFvHPftNkg9s4gSOTp6WGaks
 yJnTL4ZxnH0ij9vapuWHVnRjtKMr2G6SVQjUdXGC2YqQYun/Aq2VXGvK45lbXMU40/rq
 yBvJFSpT8atP0mt9dJMfKE5uYfc+N8w5kg4tAEGX2Bj4a06o3ntrGdIjMmdy0PC5j4ES
 xnU1QUlpqT7RJkMA9fv4BZuArqQP7u0b0sfY6kW8JsIp03DxeSNBTLez1VaXuaSC6jc2
 JNYQ==
X-Gm-Message-State: AOAM531qxg08BzjwGHbK/KsWr6iqSOQVY2SUgM1qr/Q0Uf2U7VyTWt3o
 +lHu05+lKsYoFd17s6TQIgyk3g==
X-Google-Smtp-Source: ABdhPJyEVPTtaZkFD5puzMfIs+tGPWC79KREOCpaGAp8nx5iTohc4uOl5cs7PUgnZdn+9nAq+DobtA==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr19489176wmb.53.1595848685470; 
 Mon, 27 Jul 2020 04:18:05 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id l1sm13038878wrb.12.2020.07.27.04.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 04:18:04 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:18:02 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 3/9] mfd: mt6360: Indicate sub-dev compatible name by
 using "-"
Message-ID: <20200727111802.GJ1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-4-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594983811-25908-4-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_071806_916841_6B2C983F 
X-CRM114-Status: GOOD (  10.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNyBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBJbmRpY2F0ZSBzdWItZGV2IGNvbXBhdGlibGUg
bmFtZSBieSB1c2luZyAiLSIuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2No
ZW5AcmljaHRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgfCAyNCAr
KysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQoKRm9yIG15IG93biByZWZlcmVuY2UgKGFwcGx5IHRoaXMgYXMt
aXMgdG8geW91ciBzaWduLW9mZiBibG9jayk6CgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
