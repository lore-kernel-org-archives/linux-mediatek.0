Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7EFC3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7mFPIS7KuET9lAFKCCguvkomBVJYnuLNdS4MKxbOHs=; b=vwPk8Dwzp4GLkf4AMFD8qYPoLF
	wObdrCEYshhxPRxr8mowulGnhV9ugug4fiO4XtawUu8OgXQMup3Bz5yfrW8nWJGLZRUSjrWKmN8nK
	geuhP7DskWbljwykRXk5R9SmOHDurzMZiutdtkGp9Ul01puPBY7e/930G/jaVBl9JGaz+3hD/ZHNW
	O/2HVBvPChVBIqDDiWpWVyuIzID4Y/cmaHMoYU/c0h/ObRvI9coVCuscfQxLu51y53AC6aTcNOlOd
	ljT01VrpeuEpnHoz3ylythalyzFXpEbGPrzB40o1vw0AV8GKlZFfF6oSMkMhLq4ySm/12a4kxP6M3
	8wECtOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTI1O-00000006X0l-1ye4;
	Mon, 15 Jul 2024 09:29:26 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTI1M-00000006Wyx-0xQO
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jul 2024 09:29:25 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab8cso6413821a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jul 2024 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721035762; x=1721640562; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b7mFPIS7KuET9lAFKCCguvkomBVJYnuLNdS4MKxbOHs=;
        b=g+hgPyxZ+lzIe2Kcx5yafKhHaN9QCztVy41hDyJ7IIevXwuyz5gB0Z4U3KBYGEQEkx
         AjdnBuRuq3bLBo3AVAeoYkkGpJSvhey/GYNiDdjBEg2zNin3cHUKHb7VobHiKYc+6WJ1
         OFgm8iFxiLwa3tpks8XOIrSb6EPA/1eaidPu/vTvtwgD4DFVxg17KrCgcCVQlNAyOlVP
         cgKzjZwqwRnCMVUAn6irTvIqJuACc3g4ECC06c1n0oOSzNYnDSAtXsPzmhIJ4sAvAYar
         eL7MIGZj+p5++NmY6nkQjM/6ilPPLwWQuNsreVXqz81Bdvqw+7O/iPUYABmCZ12Ty3HH
         8Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721035762; x=1721640562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7mFPIS7KuET9lAFKCCguvkomBVJYnuLNdS4MKxbOHs=;
        b=RULYbaOR+wIjPe0a4KI1sVJ0kIPs5AV4Bg6rDzqgkoOZIJhnlc6GrcyEtAerZApi+J
         2VJZeGCqFVaRCpxeANCcV846PFylNCbvOcxcaGBNlflFVJEoiW3z+5mTqDc4FFlIFRiy
         exIO9kC3rWT4DCdJsBgCjTkEU0Hqb6k4MrLF+AeugxLMyt19edXCvcN21nXrf5fhlC5W
         JFwuAXxMFoS7zvigs4xTWK8oTla4HqkoLwq0WWEeGWjkqZY3ol8PDFeBWUTd0YMNbgpv
         V9TEfbcw6atcz9UoL27T4vlltfQ+PqJ5mIetql1q25kblIAgcZ2LIZP7wH08R/X8Qzg9
         3OjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq2pI423kjfUPcyEZXsMaR81VaJtDnJCtVIigrfL+S19E9rnqvH5VfpyslDjeTkPCYf7Dp3R9thB2ifCQ+Xh8KzkrfO/VIvNoT2YOPpZXAuYAL
X-Gm-Message-State: AOJu0YxvODYdc3t0WceTaDE6bX8C3owZyBVOH4oQSq4YFjYXBl0eMkcy
	uq9elW8eTEloNQo4FnF8eNRCs3Td/ESpPilzysEwXjgrVyMSVanu
X-Google-Smtp-Source: AGHT+IGv1K1+lIe/0yB05R4JzCCdf0eydJmVPPAPqknqyilGw1RhtZ7nOd93r+iW83j1MR/dSqKldQ==
X-Received: by 2002:a05:6402:270c:b0:57c:68fd:2bc9 with SMTP id 4fb4d7f45d1cf-594baa8bd2amr14998683a12.3.1721035761474;
        Mon, 15 Jul 2024 02:29:21 -0700 (PDT)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b24f56d2fsm3134232a12.25.2024.07.15.02.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 02:29:21 -0700 (PDT)
Message-ID: <68370e680ab4d39ce5710086ee62711b22ea48ee.camel@gmail.com>
Subject: Re: [PATCH v2] ufs: core: fix deadlock when rtc update
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, beanhuo@micron.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com,  eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 chu.stanley@gmail.com,  stable@vger.kernel.org
Date: Mon, 15 Jul 2024 11:29:19 +0200
In-Reply-To: <20240715063831.29792-1-peter.wang@mediatek.com>
References: <20240715063831.29792-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_022924_291738_13740A5E 
X-CRM114-Status: UNSURE (   7.26  )
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

On Mon, 2024-07-15 at 14:38 +0800, peter.wang@mediatek.com wrote:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ufshcd_rpm_get_sync(hba);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Skip update RTC if RPM stat=
e is not RPM_ACTIVE */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ufshcd_rpm_get_if_active(h=
ba) <=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return;

I understood your intention of this 'retun', but my understanding is
you assume that __ufshcd_wl_resume() will schedule rtc update work,
however, before the time that __ufshcd_wl_resume() completes, the RPM
status is not RPM_ACTIVE until __ufshcd_wl_resume() completes and
__update_runtime_status(dev, RPM_ACTIVE) is called.

If rtc update work is performed before __update_runtime_status(dev,
RPM_ACTIVE), here you return, then no RTC work will be scheduled.

do you think it is possible?


