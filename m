Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D42DC2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcbo1O40NYoYZdrWPya8nyvr022z8GlP9Ixplradfzw=; b=YPxfkwVVYsRUAhCyiCpsBCT2SO
	bpBlng6bEgUyigo74MT+D0rLxige6hFlcKfrrRwWXaihreQazmk+8MmQ/8CkIyPzJIBsAYAg1sUp4
	SPYGIX4Q3qVaM8kD6LtLFkBiOKJs+78huhU/4uoA66EBNFfIewkiZ2RzaO4/jtOXoZflHx6DLZKtz
	T0Z9X7XEQkJf5pcXsjbodXF3SigXKq5NXBne0AbToXRQduWOn38waq8x1s7rdh/7H0CQ+zDffW1IX
	7U4jmErFIAf8EXxKnHKfn9t7yjviLkO+zRra3EDsoK0CzOG4QR93JbQOmgjv7ElqQCKAM76evnvQ/
	FxCJPTrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCvu-0000000HBYG-3Vni;
	Fri, 12 Jul 2024 09:51:18 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCvr-0000000HBX1-2XmU
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jul 2024 09:51:16 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a77bf336171so319056566b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jul 2024 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720777873; x=1721382673; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mcbo1O40NYoYZdrWPya8nyvr022z8GlP9Ixplradfzw=;
        b=JJQhQ/fdd7j48WDjRRkQx18ICMAy54RfF3JJgF7yAG25YuI+4SzdR1Mg5up5sNnSBX
         UfCFX5tQjyAXu4SDvluFk1e2h3Q2Xnxn3c62MbmYYSOPMb/hMk4oVzi0/bBAp3/Ud1oE
         EWoILUC5O55cFzT9pQpL5JyiPaoW2232tw8bUTGfT+IOd22Axo1VGfy4BUC7mw15IjlS
         67ffXx8aHsSzZZgvXTTmkOa1UX38m/Cin6GjtmsRxwDzewqHcQGywyiVJcEK9ZOz6s2z
         X2bnHht/TRJK4Zf7kLqICqrcF6uch/6FW3KGNXlQXcpDgLgtaztJo91o72nSyZn1qxij
         k7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720777873; x=1721382673;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcbo1O40NYoYZdrWPya8nyvr022z8GlP9Ixplradfzw=;
        b=wwiK/9uWKd+mzMolu9Sp1CqLGQGiL+4PgQhzK4SP8Y7b7elSEd8aHT4KXi0Miw3uMU
         SuKYFek48TwmpvLBs2DTKu3PhtC9BdaQPpmA/ZZlIhsySAP4h84tHuLVZhEDw9RjjPql
         OjIAYTENpM8MKBFHKlMb6L87NZ2ZQs3lFKhibShTrOZCDWgcCDegzzNKuMAYNtioqz7H
         OyeGLWykX13Uhnynej1uDbU4AffCjtUH47tCS95YHIwzujdAqCI4cKBIrxLH/81er4VY
         Fb6UsA09LUNbhUJd5fuOvi3Yy/4tOQoXvEjbBYvlpo+QPYJcFKspKJ9K8ry0nkvNkAZ/
         Rgqg==
X-Forwarded-Encrypted: i=1; AJvYcCUTNfPGALJfUZjb5h09y6wygTiBvY3v9ZsrXcUtIFifaRxYzgK8rqmuc0VbbF3lfOoIFz5Gy+We1XTMsRU3aJ560ePT/SigL2XNCp7IRDwHrpI5
X-Gm-Message-State: AOJu0YwIGHAF/ArN9HapQeZl0C15tbPSPfePAOTTKj3KTfl914vF3Q+n
	Qrpn/obCGq3rtE74xtUv6KlQfYY74iXoLln5HlolaMEppjmQ25/aMMPtrVc6r2I=
X-Google-Smtp-Source: AGHT+IFanRBXAqJNBbDeVq14+irw0WN8X0FhrLWxA/HrfYnU4ajfi98RHQ9BMdUCyn7WZEvJyjUfCA==
X-Received: by 2002:a17:906:528f:b0:a77:ce4c:8c9c with SMTP id a640c23a62f3a-a799cc4ed03mr152434066b.8.1720777873034;
        Fri, 12 Jul 2024 02:51:13 -0700 (PDT)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm330649866b.80.2024.07.12.02.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 02:51:12 -0700 (PDT)
Message-ID: <cf08dd694b3478e53bf07a4d916424de10f7e1ab.camel@gmail.com>
Subject: Re: [PATCH v1] ufs: core: fix deadlock when rtc update
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com,  eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 chu.stanley@gmail.com,  beanhuo@micron.com, stable@vger.kernel.org
Date: Fri, 12 Jul 2024 11:51:10 +0200
In-Reply-To: <20240712094355.21572-1-peter.wang@mediatek.com>
References: <20240712094355.21572-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_025115_662665_9F73D63F 
X-CRM114-Status: UNSURE (   5.80  )
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

On Fri, 2024-07-12 at 17:43 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> Three have deadlock when runtime suspend wait flush rtc work,
> and rtc work call ufshcd_rpm_put_sync to wait runtime resume.
Reviewed-by: Bean Huo <beanhuo@micron.com>

