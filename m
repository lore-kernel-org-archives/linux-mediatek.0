Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68061C5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=; b=SRmgnO9LzoRgPmE5WeKpKWE/7h
	w28B4s4Xihzoydu/hwnzENOFNxsUOlwUYWTQ/Cuq1cUyT9MG9bxQKMO5TPPvJxFVJBRXY9AXYj8C7
	TJUYz+dgHHYJE6Ml60wFYz75nYTCS8UP6jWMt7PeuBX7h/ILoWB7ccXngT0uh14kbioH32i4IfvXi
	4Q5sHKpkixoGoyYT0RCVW+RSgu55zp0th9IM0OxZNT0Ebu21TvpiO5Z7ZxofXASiTlN5seNII0g1D
	VZFlF82SihvxXRfJFWwl4uFJ3tM+6H6eca/oIKfWhWoSXxTpBSnKEZG9FtO+x9nuZkqZVw6IPi3u7
	uVoLnIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Lz-0000000AAHf-36mW;
	Sun, 09 Aug 2026 10:02:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Lw-0000000AAGw-3pVq
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 10:02:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so14221125ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 03:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786269718; cv=none;
        d=google.com; s=arc-20260327;
        b=c3U26kGAReQJJS41bRJ+j3LZ2eE/wSfWJSVQ6bJgX6TP7ObzFP5Gh1r/NIRaSTax1h
         afsX18RlH3+Orxorq1HRxAgQjQokJh65nn3k10X49pXVGT3kBFv3YV0zOKszMbozbqvr
         O7A5EUOUqOY2WtDv1ebBHGf3PeWFaB2v+UP/tvDw8PjB7xHpGyA8hyh18QW72jRl2mJN
         a3wXnF3WKTczTfEKhujgKheeOfD6qQuxUuYn+ptEyrOcl+nD21vgW/VELjZPE4wuM3oW
         OSGTDrmwSLhNbINjQQA4dV10lbaK65MzanqErZak52lLkKFL8OsOTyGNObAtRLIPznDQ
         QrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=;
        fh=yLQobXQSipYQ1Rd+i4od0TRe1ITUsaGiqn2l8Yezs/M=;
        b=rh3hoTMb0W1qUgB46BkXLkFDrIrXEO48g+atXTdkqr5hIWToO2T7WuKAtm0ki+UnJQ
         AhrFIinn/jXpQ6L7lch5m9OO61t8mOoEpu9HhwGpXtuDZYMqtE83h3Quxyf9iH23tuUp
         kfZBr0TlRT5HVZfyuOfvrmmdrWY9R/nBP+xF9PiL2m4mZj12NjJnZM3KFyobirLkE5UG
         FODB7fYEbdGm87F0zILWJJqKEHClMT/y6IqmEPe9D4wa3MmK1FOgpI9qbBH4mNP+V3M5
         Ea0IBDoGVs4JtJ2CBzmNbLZmhyRb+/TadG/JIMYg1CsSrBaUXbVOQI52XNbghxBmJdZB
         /Tlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786269718; x=1786874518; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=;
        b=USW8CBqvJtRCzFwbVNLpJDqHbfzlyT2SMx4Aof/sg7Qnc+1RaCWlBiJHL6u3e7WCid
         xCPtIe4pV274ydR1Uu4qRWi5eUpnTx0pIh54Xx98m6Dz1IsWMWfafXf+3sc+ATxF7vvn
         xoDZi72msi4kesK5Yqjn4bFnsBsDfoMRL2EHEgIqgemglCRhIa0xh+v2wk09m6aY+A6o
         zsPWMsv/Lg5Yeh0KlYpacfwa/ulUBNCnzFpQUYp65oDCiEtyllD2/jCzbLbyqvEVkt8L
         zxp2V8zkhyoXhopsRgQ/Vq8oVbx98mzdfXMln22y+oZ3+MKm4QSqyFufRtvaxPQHl9C0
         GSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786269718; x=1786874518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=;
        b=YGA2A1D7VCHDZL8KYQMRTzh6DSAqcKmn6buKqtB99xleR8EvRkGBPs6tdR2Av7b3uG
         KQgwSR20zAHf32OmVh2F/+Y5v6yhQ0/3sY8SQPUP/IP8PtrwkzKh/MNKjL6QcCTZuv2B
         C6+3SlbH8m4sPQBkktysaVdJzZYbNLhaZxr7JwJompFvbnJ8B4d7m8gFkk4L8Z0yBzeG
         grp7iWnyCYwU60+yDstzv1k5U68rzu1NsOm7r379hLUqfxsBCUkp2XajZaeNAd08v5qv
         zTV3aIT1ZklYhEoxGdfCrehI8qSbpYc+ANz5x4jvffVD5GtG5e51Q/WFaRPjXJw4rCVR
         AU+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqmwEv5CFApZ3asu9g42sMLVQlDxKfUW3yfdfEDpW8sLf7nMm+xKv/W6kA9d/Qk2m/TmInm8SaBugpFQO6Rtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMHlX0G1+W/baP9z+TZms31EkX8nLIww3cMYIp3+3bd5AF7cgQ
	CK6k47k+8DAPRZAf8MHcz7++JZBI8lq87pwEXmQ3g9NUh2GsR3HK2SOfasc2iwIvYayoa15Stkw
	Fp9jw2Vf3DJV7jJ1QMFISD3peRBwUhQE=
X-Gm-Gg: AR+sD13eAz2geA7cgiZy4B2nKI0819R5kQS2E9/z8KxpxkVIAVk5AWkD8xPJyelkRG3
	06j0CqYgbEJ8+6NNsjBmvO55ePYgA1Fb2fRhm7Kh3h2U1bfubHqCDu1y0Nz2q33/FRKJBydNfsJ
	l7yDHiE0jhlUU4tmR/1rUBBDgOh7iBms6jOFRlgfTCLbNJrlNHC8sA9DnBbDdF3YW9saTCFngKD
	1l5f3WFFp0ENj/OgTp/Sd5FF9avIyOLNziVRlPeZSYNTEnLCGMCaEE/oFxhZMlQgR+Icg6ECksh
	B8tNtjbuW1Fde7l8MzKjyrgnsmL1DQYWQ8KhDMsaTJLNEinFwVswiij8Dx2YXhN0pzk0EicnFSO
	7iSBhjYle+Jr3JY9wYIuiZ/eQ6tSvSfHaEqvGmJ5fB0f5F4oHEkbxTz/iskK/5TYmllrNngQc82
	jJJYbEChu5EBbL5xe4
X-Received: by 2002:a17:903:388d:b0:2cf:84bb:1ebc with SMTP id
 d9443c01a7336-2d294c223bdmr207346785ad.15.1786269718053; Sun, 09 Aug 2026
 03:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
 <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com> <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net>
In-Reply-To: <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 9 Aug 2026 17:01:46 +0700
X-Gm-Features: AUfX_mw1KVezTWqN2z4u9TeLCw86vjeGY2Ka_ePvHYwoFPbvJwdHv2HuwDWFspk
Message-ID: <CAABR9nHu4pt-Rg8Aq0B6KfKFHX+C1xQmMk6=j8jq1Zn-MQ0p6Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_030200_963588_477F8C3E 
X-CRM114-Status: GOOD (  12.30  )
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

Hi Guenter

Thank you for your review .

> >   irq = platform_get_irq_optional(pdev, 0);
> > +if (irq < 0 && irq != -ENXIO)
> > +        return irq;
>
> This is still wrong. If there is no pretimeout, it does not matter if there is an error.
>

If checking data->pretimeout is required here, I'd propose one of the
following approaches
let me know which one you'd prefer:

Option A (minimal diff, keep existing structure):
---------------
irq = platform_get_irq_optional(pdev, 0);
if (data->pretimeout && irq > 0) {
        ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                               "wdt_bark", &wdt->wdd);
        if (ret)
                return ret;

        wdt->wdd.info = &qcom_wdt_pt_info;
        wdt->wdd.pretimeout = 1;
} else {
        if (data->pretimeout && irq < 0 && irq != -ENXIO)
                return irq;

        wdt->wdd.info = &qcom_wdt_info;
}
------------------

Option B (check moved out, before the if/else):

------------------
irq = platform_get_irq_optional(pdev, 0);
if (data->pretimeout && irq < 0 && irq != -ENXIO)
        return irq;

if (data->pretimeout && irq > 0) {
        ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                               "wdt_bark", &wdt->wdd);
        if (ret)
                return ret;

        wdt->wdd.info = &qcom_wdt_pt_info;
        wdt->wdd.pretimeout = 1;
} else {
        wdt->wdd.info = &qcom_wdt_info;
}
----------------------

Option C (default-then-override, only look up the IRQ when pretimeout
is supported):

----------------------
wdt->wdd.info = &qcom_wdt_info;

if (data->pretimeout) {
        irq = platform_get_irq_optional(pdev, 0);
        if(irq < 0 && irq != -ENXIO)
                return irq;

        if (irq > 0){
                ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                                       "wdt_bark", &wdt->wdd);
                if(ret)
                        return ret;

                wdt->wdd.info= &qcom_wdt_pt_info;
                wdt->wdd.pretimeout = 1;
        }
}
-----------------------

Let me know which one you think fits best, or if you'd prefer something else.

Best regards,
Phuc

