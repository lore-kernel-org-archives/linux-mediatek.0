Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAACBC78829
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 11:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Date:Subject:To:Message-ID:From:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MxitZxgmvoGPY/D0MWsatY/SG1INnyxTi18mvHYSZYE=; b=f2+vmNhfQtPqmbR6tZuX/zDGKD
	oXGaGd2asOA1/Fga4xv2H2TObIvBClZEcdUgIkqjPrdiTbJwhlSd0dcR6/FqZJ0Hh+Qtn925XiANa
	E8gP0RrlvZ3pDrKcl686biCwZAJpaK88Y4bfHqnx1my7Oyq0MY1xkiTiDt/0IY0B4Zw/xUlu4lAna
	RgLDZy4LyoYLPb4I0KcW9wiKAUPcJ7WqYt5rs28Au/lucVZbLJqLuc8JQWbmhbAEhFhlMvV1HJja3
	YHIDQNcIcSSTD5pznUEPHhxobkSyjnX/3sA3XmLhDlEfJ1+tlhArOGnvnMRKuZ2Ra6B9ckzy+It1g
	eRzpl3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srcAZ-0000000C7W8-1vFj;
	Fri, 20 Sep 2024 11:51:27 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1src9e-0000000C7QS-3euX
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Sep 2024 11:50:32 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2068a7c9286so20483055ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Sep 2024 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726833029; x=1727437829; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxitZxgmvoGPY/D0MWsatY/SG1INnyxTi18mvHYSZYE=;
        b=VYbeHA7pBmHdZWbBTFrLriGWhr8FOCSm+gnVnsvyZgSl8N/mo1MHpuAMGUZDaur7PL
         XV+2UE+HyAlA1OYrRBDTBvFDRK7P0vcKmcSdI/kkH7H65G4OYK46VTmxcJNeiC5sxh/5
         P1Ta6ZpAXs8XjbdiNsyB8b7z0XDfUFDgczD+3tXGT381/n8JOlgaOi0uV4g++AWAsnX+
         rviRvTudlz9XH+LwGZSx2uQ76FkQBHkV2Y8giSdjch0RDOprodYVE2AMat3x7Gxy2As/
         m4gGzTaDeUrFh0kHRb+RzDzglUgHMwLW0ULhPia4Xahps4OptooKewNIIvRAI+fkH5iG
         8s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726833029; x=1727437829;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxitZxgmvoGPY/D0MWsatY/SG1INnyxTi18mvHYSZYE=;
        b=K+/rdVUYiZVBAJjTv08fdqbvPm6jaEPZsvvNhqpq5M3xV62Jgb4QmiOxcVMHcDIqYj
         Om/pkZzj1eXKcPbCVAoK5pXPrQRxeffFNSJahRTeBIzovBuMWuyiIiUS1X0T9L8RjaoY
         YhAhGjOhzmcDg3Iuaz3hPceTH9l7nZLUkzcUtXC+MY3XBdCsURHb2u2LoG8pna4sHEUQ
         60+dY3d38vlOPWVKytKOemjU9X18kU2dVAh4zdamtCSMeNCEeOGopyZT0tNZ9mpyJrrB
         3/3qjkieY5VkoDfaowwn1XurhiQDrJq/y8mfnAMoZhIIa541mcnMrOd4vkeove9ecn8k
         KGHg==
X-Gm-Message-State: AOJu0YyLf+gL4eF0z2bVStQnoWofirRPA/vD/t3nEAZP17z08GqNg9fP
	odg3WR8UBYaweVbB1BFPPUaFNffCK5lwVedT+2F+JlSVmRbzoa5YjiTCOUs3gd4=
X-Google-Smtp-Source: AGHT+IFYO66SCrhnrIBdZR9+IhcyNvZr6oCcc/zjQLBtmSuvYKatUETUgdAz5R2E2IHgKheKH2SUWg==
X-Received: by 2002:a17:903:244b:b0:205:809c:d490 with SMTP id d9443c01a7336-208d837f89emr52050805ad.16.1726833029024;
        Fri, 20 Sep 2024 04:50:29 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794602f36sm93867005ad.83.2024.09.20.04.50.27
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2024 04:50:28 -0700 (PDT)
From: Michelle Fangman <mosekitumisang2@gmail.com>
X-Google-Original-From: Michelle Fangman <michfangman@outlook.com>
Message-ID: <abe50e1102d87b4ea45843792d836c0ed4dd7789c369c5589dcf1e6be5b17f70@mx.google.com>
To: linux-mediatek@lists.infradead.org
Subject: Baby Grand Piano  09/20
Date: Fri, 20 Sep 2024 07:50:27 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_045030_915154_CD45975B 
X-CRM114-Status: UNSURE (   3.32  )
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
Reply-To: michfangman@outlook.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

I'm offering my late husband's Yamaha Piano to any music enthusiast who may appreciate it. If you or someone you know might be interested in receiving this instrument for free, please feel free to reach out to me.

Warm regards,
Michelle 

