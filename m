Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E562C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 14:15:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 271DF23A33
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 14:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 271DF23A33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+gWfFaoD8uJeMAhIVotbenDQIjBFR2qZ11m3UQJLQXA=; b=kQmlbUak6bPfI6/Wip+ysbBAd
	Sx/0TZXNzmoWH8WvIl6qET3/+pmbrGkBuaYEV0cTtfX7War8PmjDTst3tq1OVNUlkpo2gBMWZMYxO
	AfZFmRe7Ga/vkUp0QWG2/a9CkUOVerRFMhBbSWxouP1qrJPA+Fl5ZWVOIKj64Y217gpJ8r5l2ilvw
	wiwlJLoFjR8Ht4Mt+d3i31V8uJSuF4dcHv3DLchuL5aMpteuBNZQmUgaPaPUWWOk6A84+QFb9EALS
	M8pcIQxcNHVCmg+YLrjLA1nePE/yrrgdavvKAw7brMXMEpYGk9dpVG6Uxp1TuDLQ6wBunK8cJdWN5
	Ag94kkfjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmdlW-00058p-Jf; Tue, 08 Dec 2020 14:14:54 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmdlQ-00056W-QA; Tue, 08 Dec 2020 14:14:53 +0000
Received: by mail-ed1-x543.google.com with SMTP id cm17so17760010edb.4;
 Tue, 08 Dec 2020 06:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ntk4ARBzMoRorjAN5A/E5yNdlDF2+4r0PmHqGriz3Rk=;
 b=C1J+nDwNp1ZdfO0ijKKGYCbe99/mqtc9zuQRgAg/JScQqexUHY1PPSPDgFbHxcUdH4
 0TVK2oVf7BcaaS1BOYAiozfNKMlkzEti9NkTZsBSpQD1qHpLKIqKkzEpzkGUgALoAfC9
 HBAQ4QAeupYVrqxd/pHK8xPuxm1/BVCfP2fP7irCwx1fX5eDThEFz0a6CIhOys9RgI+I
 SjasLmQGCz/8U3j0UVCR5Nnb7VXUqRTgJsxaezQcB8qWBOCLO1HrEjE6yFodpfazBswf
 cvZlWMFljWu5RxB1eJZRiJ/E02SbkC7dw9A2Ai/rUA++HUb8wkQQBevHmDDD71L3xMHv
 doUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ntk4ARBzMoRorjAN5A/E5yNdlDF2+4r0PmHqGriz3Rk=;
 b=Q3cyTrFBzioBVMt+sTiHWsXG3XyAad293ktvwJgqrQ9nDsbOoh1tNGHAp/RF+QODO6
 jlsSypYRaeC5BXIfrRzl1K0oVOElgmOkceYjV0RudDSsI0w9cUwzsNujxmzYXGXmo+lr
 XTsOWKFuwd6y+gtFABEu7QkQS0e8yhfFB2qeqGM+t9O8kVFLQMQXcCUxIHjr+0HshTko
 uMtt2VDgY576y20on8sHI8DcyCk161rvzkmpfZGsP5tTmKSmDdfi0bt2O9CIqA3cU1Vl
 f+KaeaJEcDEkQbf30Zn0IcPhBpS1sAw3IKwwJURL5XtlzUD/ggqrU+7PcQXn/SHaEy2O
 oDMA==
X-Gm-Message-State: AOAM531fhutW9XO0yS0M2yliBnlRJ5J2grGvIoDyQsPn9kVJtG4FlVjN
 FNgcpcofWO5+Nm7ZZKRKeo8=
X-Google-Smtp-Source: ABdhPJwwn/b2Lb5c51CunsFgtGkimppN1lP894M6Gb0uMhuNwt9iTzSJoKqU1aGPUVT5ALatSoaYlg==
X-Received: by 2002:a50:a410:: with SMTP id u16mr24994533edb.274.1607436887471; 
 Tue, 08 Dec 2020 06:14:47 -0800 (PST)
Received: from ubuntu-laptop (ip5f5bfce9.dynamic.kabel-deutschland.de.
 [95.91.252.233])
 by smtp.googlemail.com with ESMTPSA id g9sm17305447edw.67.2020.12.08.06.14.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Dec 2020 06:14:47 -0800 (PST)
Message-ID: <b01dacacb713ced3bd9cf07ec7a00b4eac5b5a1a.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] scsi: ufs: Uninline ufshcd_vops_device_reset
 function
From: Bean Huo <huobean@gmail.com>
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org, 
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
 jejb@linux.ibm.com
Date: Tue, 08 Dec 2020 15:14:45 +0100
In-Reply-To: <20201208135635.15326-3-stanley.chu@mediatek.com>
References: <20201208135635.15326-1-stanley.chu@mediatek.com>
 <20201208135635.15326-3-stanley.chu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_091448_944858_C4773193 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: bjorn.andersson@linaro.org, alice.chao@mediatek.com, bvanassche@acm.org,
 andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 nguyenb@codeaurora.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-08 at 21:56 +0800, Stanley Chu wrote:
> Since more and more statements showing up in
> ufshcd_vops_device_reset(),
> uninline it to allow compiler making possibly better optimization.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
reviewed-by: Bean Huo <beanhuo@micron.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
