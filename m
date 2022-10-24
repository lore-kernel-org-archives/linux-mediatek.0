Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4408DECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sMr5LMpx7kn/7s7Sx7ZIZcqCa9AYhMtKw0LeVc+4NY=; b=hwYhkb9C+oSe7w7+vreJ6fG4/p
	MivjR95lsye1R4oPkDREQFB92CWyQ8w/t9QnZBB0slPhwm/8pA4S3Zz0KuAODtvsz62OIcxPtTSMt
	K20HTt5TIuhNlGvj+kobLSPlkF1lLy+YQ51dHctpz422iOcZRBUnyN4DDuIe0K2iajlwnHajw1Qjc
	tvXRDnEn7IajdcFHMbC9ruxCH00HNK7r1crO8Jom/Z+HKTee15XMb/Ze33P5ypnbNPjru+g1J1f6P
	LFl3frI96GWO3vX/7H8qXSbKhMIVILuwqzTch06+WeRHAUKrM0GieJas6QSfcbFI3joekgfbztFPk
	aTaj64cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omxJO-001ej8-6T; Mon, 24 Oct 2022 13:16:14 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omxJL-001egw-BV
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 13:16:12 +0000
Received: by mail-lj1-x22b.google.com with SMTP id b18so12670494ljr.13
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 06:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0sMr5LMpx7kn/7s7Sx7ZIZcqCa9AYhMtKw0LeVc+4NY=;
        b=Z/hgfAKaoQy+GtgOeyfqMYXizV03BcSToMv8i8Qk2ps9uXuoyBwf+Ukb21VG/x1cEa
         5jAQUtb0j7Z9HavrSf22TIWPhMbBOKxp+rOMetug5iek1n3SziyoFCnLq0mHJSRJddE5
         2aQf7t6LfdqAgX2JrhHF8e6g34hQI2Wf+1whiFJw+KLsfET9wCnk3uPAmzHErYrDEUbr
         5sir6S5k78hQ3IpfkowQgdrZJ/3EYdgptWiv5Bo/Nl5ZbSqEyZ45YRFhuP0TMxJr3VbQ
         6IQ8d8ZfK3DLYIZNYwnMR3LOuzvs6h3iJNJ7WX0PUL57YCrBoU52VdkWAiAKgpIedwd1
         6tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sMr5LMpx7kn/7s7Sx7ZIZcqCa9AYhMtKw0LeVc+4NY=;
        b=e0MokO9LWRNIDBCOVUt/SUfRppdoDS0USMS4bZmw/+TdK/pV8vOdyEti//D45hqhiQ
         Yg9T6MzFOZmNGtjALkiPRRxvoMhjbFiXyt2zS5W39Lf+sPv9ds4kAm1tVxp+zqpvGU7p
         19hQ7ShsG6kC1poFCrN/o95ijSwvazh710DsZtvYrE0Ld0GmXIIncvnk/A62jB15V/IP
         s1x9bMwfTWu2ng1rBlRS5Iinxs23WjE+C7Y8w4UussXrtD+qmonxXxqJXXOmB10BArAm
         eLjQvo4cMEQVaEguTCU+bQ0hzhHrvsuf6i5kFLdpUkwFJAhzjhDZhvcpv2AdqjLc8Nyo
         KOkA==
X-Gm-Message-State: ACrzQf36sKLmm7oZbZRTkHpo76/RnQcvnJgglMEHfc1pDHWWUFeYm6T0
	Ig8oHjaDs4/XmA2owaOVlcxSkYiWu9qtwPdPJQ==
X-Google-Smtp-Source: AMsMyM4xh6amhZ4agKbym874OYc20ETwDPyyOUFqBwR4FwgLL/x9slo1C8nDPcvN6MIH+SPXsukS86XMHKnVJ+Fo2/E=
X-Received: by 2002:a05:651c:1a22:b0:26f:b314:6fae with SMTP id
 by34-20020a05651c1a2200b0026fb3146faemr11276181ljb.307.1666617367678; Mon, 24
 Oct 2022 06:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221024120602.30019-1-peter.wang@mediatek.com>
In-Reply-To: <20221024120602.30019-1-peter.wang@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Mon, 24 Oct 2022 21:15:56 +0800
Message-ID: <CAGaU9a87HoN1JvzuTAuDFRc8UaLOUfEALyrED2Ke+kH5=zbhFg@mail.gmail.com>
Subject: Re: [PATCH v1] ufs: core: print more evt history
To: peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_061611_409078_F02DB66C 
X-CRM114-Status: UNSURE (   7.75  )
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

Hi Peter,

On Mon, Oct 24, 2022 at 9:11 PM <peter.wang@mediatek.com> wrote:
>
> From: Peter Wang <peter.wang@mediatek.com>
>
> Some error event is missing in ufshcd_print_evt_hist.
> Add print for this error event.
>
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

