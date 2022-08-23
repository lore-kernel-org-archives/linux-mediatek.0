Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645E2C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3KIONbPiHyRMeK7Ev2jQpkhdNrH3jXKSsU32bty/nk=; b=ANgRrISMfzbpLiNOveBG8P3IaB
	aruVEPe+FyfugDrJa3SfHreBu+VsMlVJETHQ/3buW/pkGuEySrkjYwSrsAPm7a7WCaibq4/Vog1tx
	a15U/oP6jJDxzDdrZMvMxanOUkw4v/9tpbZLLFWy2ogfHt3pkGaXtJq0RKfRNxLv6/dIQ/HrMx6LB
	hAq43Rvmt1lNeS/LUi0HYW0hGcJHGbgGSxabVDYLZm20dq7wfL5S/x2bCVCrTP00ASRufxTsJXDKe
	xmrjER5mhUddIv5nT6OuX/+i412mYRHRteT2jw6ZfuKQjJY90RqftwOw1fn9CTierNbitunmB65l3
	/tzumMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTgB-006DoU-8w; Tue, 23 Aug 2022 13:10:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTg5-006DkV-9g
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 13:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661260244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3KIONbPiHyRMeK7Ev2jQpkhdNrH3jXKSsU32bty/nk=;
	b=BxrHBuz8EBBanm/JbDLKjnuilIaB0sI8pr+dgA4+ANFEFOK6D1D9Mq5ln4UMwbPwkYkCWc
	d1gDMnZfdltEDjK4SL9mQdIzrihViSAl6i5FGB1GL+j6fmvBQEjKdl0q1UOed1y4ojQ6JT
	hqGIKoAmYqWupGPQxkJwseax16tQ8Go=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-Qw9FrOznMWavZmB0fTlepw-1; Tue, 23 Aug 2022 09:10:43 -0400
X-MC-Unique: Qw9FrOznMWavZmB0fTlepw-1
Received: by mail-qv1-f70.google.com with SMTP id cv17-20020ad44d91000000b00496b9fdf13bso7341099qvb.22
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 06:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=K3KIONbPiHyRMeK7Ev2jQpkhdNrH3jXKSsU32bty/nk=;
        b=pLDWYMejZGk2qUQ9h5sR+ZsEJX6hpXBBDEaZvEZtUGrutkX6i48aQ4pScMc0/iUC+s
         wpHpbGt2K0KvAd/wKJBce6jq//78vTsT9Xfx1+AzhpkSz7aXNnZeyVS8PG6FITye18Hg
         GXKSTLBuojnJsuwP23LSwNOFBObcBvHi+2qL6WbNdtl5h+YTNQo8V/6fqSrtIdReDkv8
         U4uKPvKGdMyQoCs1bllIwOXanogDIWatCorQzrRnVrmvl2i+Af9hVm/ElflikXM8730P
         e8IfAY4UaKE1pAjdcaL9zdEzLNDtQL/RknbhamuQQFjgdBoLw97GKtIBO0nY/I1orv6Q
         Vfmw==
X-Gm-Message-State: ACgBeo399gnuvupzbJiLNKz8O140JdUrnKaj2dnaQCf2cXADXlqB06g5
	yn9+JQudw9HCOffrEW26ErvDad4mgHB27TC/k/6K4fhz1/bhD35ici1gOm4WjiIAej047w2rk77
	OJyLwfLmZ1ap7+reZ0O1vmNo6lPabOC1v
X-Received: by 2002:ac8:4e4a:0:b0:343:7e05:d2a8 with SMTP id e10-20020ac84e4a000000b003437e05d2a8mr19418485qtw.67.1661260242850;
        Tue, 23 Aug 2022 06:10:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR40k3HniorFJFBf5+wfj6pczi8EhQyml3G2Dh8I4rf0W+nqJePB+WvUB4zQjJjHNIs8Kh/Rfw==
X-Received: by 2002:ac8:4e4a:0:b0:343:7e05:d2a8 with SMTP id e10-20020ac84e4a000000b003437e05d2a8mr19418454qtw.67.1661260242581;
        Tue, 23 Aug 2022 06:10:42 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-176.dyn.eolo.it. [146.241.97.176])
        by smtp.gmail.com with ESMTPSA id s13-20020a05620a254d00b006b633dc839esm13460029qko.66.2022.08.23.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 06:10:42 -0700 (PDT)
Message-ID: <6f147fbd31980c6155ea6e7deba26d8210ed6afd.camel@redhat.com>
Subject: Re: [PATCH 1/4] net: mediatek: sgmii: fix powering up the SGMII phy
From: Paolo Abeni <pabeni@redhat.com>
To: Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
Date: Tue, 23 Aug 2022 15:10:38 +0200
In-Reply-To: <20220820224538.59489-2-lynxis@fe80.eu>
References: <20220820224538.59489-1-lynxis@fe80.eu>
	 <20220820224538.59489-2-lynxis@fe80.eu>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_061045_505259_F15DCAB1 
X-CRM114-Status: UNSURE (   9.10  )
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

Hello,

On Sun, 2022-08-21 at 00:45 +0200, Alexander Couzens wrote:
> There are cases when the SGMII_PHYA_PWD register contains 0x9 which
> prevents SGMII from working. The SGMII still shows link but no traffic
> can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
> taken from a good working state of the SGMII interface.

do you have access to register documentation? what does 0x9 actually
mean? is the '0' value based on just empirical evaluation?

Thanks!

Paolo


