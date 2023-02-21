Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD94C636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pFS0y7vqq1d2/pDnn81c2oYt8rE7RVykcUCRJbP4zU8=; b=sMCljsWvyGsXKXEjq8PYlRhSKA
	yZER4QuysSXOs3TszaLsmsNUJpvTwJxMDd0zoZ4Veq12tCXka92krsK9rpOKGGoe2Vy93ym/LPRO/
	M6nXaerHw9FanxGgV1Vo1M8GIQnICiS/ncX7Dfo/NggZI3SQJqvc5P/djMGtONSkZ/gW22NbETDej
	aHOewEIT93zVaxmKNRwHHPcVFlrHaiKzaI5WEF0iOsuTd2e6gxTgzGfJJQVXtb0cakeP9OrCOO3w0
	LxDGulDPSdWGXW08kAg8SDFpxv14jbkt7GuiIW6rdYn1h9iLcZjKW0U8mMmxncKyTDgmMVks/Zkzv
	xPYUSoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUU5X-008ZcR-Fd; Tue, 21 Feb 2023 14:57:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUU5V-008ZbK-0a
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 14:57:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id k37so481957wms.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 06:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pFS0y7vqq1d2/pDnn81c2oYt8rE7RVykcUCRJbP4zU8=;
        b=DHyjul9MJL5PlwXXwwvUM6xKXHIS9Qq6GAfrXS/FnNUXAI8REQpeJlONGwVIJNGpZY
         WXNn7eGoJyF1hITcPf4Wo3ia3H3U6tub4thUTH2Z/OrQXF+g8+fAWKbQVvbkYxqOGjb4
         ykbnoCb2NNmlNHN3GHW+D2CvoXk756TgFQh47K6S10DzPXNp2DqLv9O4DDUjYjdXCtpO
         LLSqpFKBPXWh4Wy/VjNH8RIdWAko30N8Awdorc3JF8IPsny96Vu3z80FtE2D1MFmxn+Q
         h3UNQVIyF7qnRBV57BuBXN9nhfips48yoxVxRaon5Y8z1XQt1h8qsbBMZ3Q2WaRj3xob
         Cw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFS0y7vqq1d2/pDnn81c2oYt8rE7RVykcUCRJbP4zU8=;
        b=EIiSj/dWkSTfh+8wbM7cWcIbQTS6s2PFkqs18RNiVNUg/boxN1XBTBlVnY4q57Sf3X
         oTf1mEZnW1w/tSxFleN3VmS70PeK735DHivxjZU1Bat0SW9Q+6o4m8yM0WM5xOw+m/Js
         YM7eeQY/gTRfHQDRpf1TOOXMLG0siPRmt/BXqtEG7zk3d5/r5T/hB3izAFGStFpSy2D9
         RkBeIBh7EgNbHTIClaqN3sIjgaTJ12lz3GAJsNThDRecRWlYAoVget4rPRf7U3E2Evlz
         lBD+5lJIBOTB35SAa/uUIgUp2J/6oE3e43Mu+3fMBH2ZF5kYInB6nYxum/hZAktRyrp7
         SNSQ==
X-Gm-Message-State: AO0yUKWPiNki3rmwKcvQ9YKzQ+sZG5BDICFwo4gFskhjYx/YwOrbxnLd
	WMcVnqFHqu7+Lo6+BH1u8SJqkh0rqUw=
X-Google-Smtp-Source: AK7set9ixciQc1BCgKsKN4BNysqAvNS4A4pq2enF6ONfqziDeZR2KFlmDfp6WrryY4DIjN8PFykxQQ==
X-Received: by 2002:a05:600c:4da2:b0:3e2:19b0:887d with SMTP id v34-20020a05600c4da200b003e219b0887dmr4214515wmp.25.1676991466638;
        Tue, 21 Feb 2023 06:57:46 -0800 (PST)
Received: from DESKTOP-L1U6HLH ([39.42.138.70])
        by smtp.gmail.com with ESMTPSA id q6-20020a05600c46c600b003dc47d458cdsm5251203wmo.15.2023.02.21.06.57.44
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 21 Feb 2023 06:57:45 -0800 (PST)
Message-ID: <63f4dbe9.050a0220.dda3c.00e2@mx.google.com>
Date: Tue, 21 Feb 2023 06:57:45 -0800 (PST)
X-Google-Original-Date: 21 Feb 2023 09:57:46 -0500
MIME-Version: 1.0
From: owen.dreamlandestimation@gmail.com
To: linux-mediatek@lists.infradead.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_065749_076803_E78FC13A 
X-CRM114-Status: UNSURE (   2.54  )
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

Hi,=0D=0A=0D=0AIn case you really want take-offs for a developmen=
t project, we ought to be your consultancy of decision. Reach out=
 to us assuming that you have any undertakings for departure whic=
h could utilize our administrations.=0D=0A=0D=0ASend over the pla=
ns and notice the exact extent of work you need us to assess.=0D=0A=
We will hit you up with a statement on our administration charges=
 and turnaround time.=0D=0AIn case you endorse that individual st=
atement then we will continue further with the gauge.=0D=0A=0D=0A=
For a superior comprehension of our work, go ahead and ask us que=
stions .=0D=0A=0D=0AKind Regards=0D=0AOwen	=0D=0ADreamland Estima=
tion, LLC


