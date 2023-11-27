Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE03C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gxUKtXvFTtxde5Trn8Yvcd1G+tM2Ob+td6M9TUIAd8=; b=WSDMoMn/i2KjrPKjtmcnUO2rJe
	1WySq3UANNCj4XguqzxT/DtDNAwp28GhIJTi8nO8M+tFnQsLL+o1LB/qgaiFHjGccEf+jqxvOwwEB
	8b+W2usvkW801+qrtEk6rr0oiXk4z0kD/owH/EqCXxun+V7Ch4LedM18vjTszLeKHG737rm/5D6Lt
	KxplOXywCB8hOHqYY3RoaDacquhz9NOk1T7lCbScr6RMAQnSNcVylxgbcYpts0h83H0WRFynHRAvl
	hs+s/gu6MyXfhti7/nfz4QqBZWBjg2iqFqfbR3EMpHiqKgC5QlGu8dJCklRIyIMWwcb2mWvUQmE0T
	O6x7Vieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eiJ-0032RW-0O;
	Mon, 27 Nov 2023 16:44:03 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eiG-0032RA-19
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 16:44:01 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ccc9e6a38aso1757294b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Nov 2023 08:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701103438; x=1701708238; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3gxUKtXvFTtxde5Trn8Yvcd1G+tM2Ob+td6M9TUIAd8=;
        b=S+5JK6vHH3gBNZvwzssK4xklJ0EX6FmwMm++kwCD1Xnp8SN3pclBoMqcdGAIEckXr2
         9unR9mOHfLc++Cp9MbcRrdx2gm++CaKfojNabW01inlinOlKy1R/b9pvUJhKLKeqBlmK
         caf0HeLf2R/r92q0kiUdFBg0qAV8nlf72PL5Pi92d4AzcNluRpZSlWeuLiPZtJowzhI+
         Askep9DOn8GIBESosAddkL3iZWXLDBv12U57HbSwFcoGTr6TLGj9ywNttpUDtA5t+EIH
         zdFGWPdlkGJpNIur38Vcspgi4QlmHCIHTGllFJ/IO5pLtcZdUdaRA48/Gmq7ZJ7vxee7
         JODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701103438; x=1701708238;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gxUKtXvFTtxde5Trn8Yvcd1G+tM2Ob+td6M9TUIAd8=;
        b=Rq4cRIO2koxp04hqye5qvye3D7QY3VNn4FErCaRYTkgJ91vmPN5ddNDfasuJHOhaq7
         xyko/rNahsskT2vApiFbEEXZNjE2MzKroIiwOseIp5sK7csVDeAHVoH9pvoLJtlgnV3M
         Om1rKJBckFItVWz1vv6r5CQL/YsAVnkicW16fxGhDbtmWqRzyWS6Z6FVAQZ1v9kGRNfD
         EklWbLLPaFJCUhDG5wkQ8AiI8p9J2hRGqk8uwUUqu/OO2NWjGWnm2FlP+3hF5glYNa4H
         I4SMCiRolDKNFXRvY5LDRcAV2XZNRGbhEb1lIj6P4DQGIDdHtShfQiaNMierisQzAS4Y
         ydwg==
X-Gm-Message-State: AOJu0YwekiraltK/a3ddcdnml/vxy7ZwQpwpDLNhDhAxvSuuTqve2Obh
	/dj6RxHnZMzlK4XVdFiyfmeULwmkqUk=
X-Google-Smtp-Source: AGHT+IHYdzcVCCoYqTMIvOlkY31QpFihr0OW4oWD2zKmhrw1Bz66o5RFeXqMeoDf1/jzobtB2h6F4Q==
X-Received: by 2002:a05:6a21:9997:b0:18b:cc7e:de3 with SMTP id ve23-20020a056a21999700b0018bcc7e0de3mr16231566pzb.41.1701103437795;
        Mon, 27 Nov 2023 08:43:57 -0800 (PST)
Received: from DESKTOP-6F6Q0LF (static-host119-30-85-97.link.net.pk. [119.30.85.97])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79188000000b00686b649cdd0sm7425640pfa.86.2023.11.27.08.43.56
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 27 Nov 2023 08:43:57 -0800 (PST)
Message-ID: <6564c74d.a70a0220.dc7b3.1770@mx.google.com>
Date: Mon, 27 Nov 2023 08:43:57 -0800 (PST)
X-Google-Original-Date: 27 Nov 2023 11:43:55 -0500
MIME-Version: 1.0
From: marshallbrecken429@gmail.com
To: linux-mediatek@lists.infradead.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_084400_414802_E4AD90E9 
X-CRM114-Status: UNSURE (   2.44  )
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

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AMarshall Brecken	=0D=0ADreamland Estimation, LL=
C


