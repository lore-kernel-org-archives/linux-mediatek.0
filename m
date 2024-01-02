Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED53FC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymg1RUEbhaahilNTpT76VrpoWo6TTp5cRA3gjAaiXis=; b=UOO573ezeO4SyN
	ZfqQo46d/PawDSQTDmJ0AH/t4SVfSDIfLPhvCElMA1CJVUUt31sm6E+zYraMF3claataVwGfbtDFc
	srzfuwR1Hxmgv6MCRH4q+b6zxc9k6y9vygfZPLBVjSQSh9P9pyOBSZa4k92Xi2zXQk62iB33nnMAR
	3osbtox4KCK8xK8uIIzIfJR9r2JBTlgBvJ7x5BuKHBNpmD4KvD0wJUtlE7lk4PEsUkGk9lBMWnbCy
	iNjNMZgO6qtEFbGe9DC7iUDG1oyIv6F39mGrHp1L3gBlzvq2YR01RFzeoMsdzRBA9kB77cYnHiYFX
	BihavkPTC1NZBFfXzBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKed2-0085Kx-02;
	Tue, 02 Jan 2024 13:16:20 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKecy-0085JK-2q;
	Tue, 02 Jan 2024 13:16:18 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5534dcfdd61so16006086a12.0;
        Tue, 02 Jan 2024 05:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704201374; x=1704806174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ymg1RUEbhaahilNTpT76VrpoWo6TTp5cRA3gjAaiXis=;
        b=QU3KLRkBaa/JPxeGEJetCghsZNYyOQrogK0myIZpqQJ9bGUb0F6rv40PJE6FDd5NEv
         +GNkiwl6nBxEVrzibpXqj6+vEMrISFKoa0Rhvs+qcsRouJHGncHFHaMMVy86+2UxoIjK
         Y+zMMEcugRN7eQUyZ4Fx0goNg+EiAuH7Lwi3q2j2zyCNRbSVQFFu5un02glMdQcAfRzJ
         TqxNz9WbajReKmRhLC11Cy6+iy2qwKFpB5WYwDPmUUeWX1gdHQAkWbH3iB+wJsoZ28Mh
         cgtI8tlZMBJvdaSaeFfldBe7huCtl7WHS7ZivewWx1Qqw58lRn6wc1tp19Geh+fU21y/
         m//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704201374; x=1704806174;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymg1RUEbhaahilNTpT76VrpoWo6TTp5cRA3gjAaiXis=;
        b=pwge31XhDBhmE3IyvVX1v8QwmmqCQuBpYmhSSvjZ6sxH1SG5CmOUwXMDKQRPkB79+c
         5zi4SeEQVAu+BVgvFyqQyBB9VqWkkhb+Z745DkLpbISxmAZQlc0Iz2SNrHNtb4j45DUx
         MeXxcgZC0uC8p26i3zcbPh3xnhUagWNzIILD8zDYb84Uy/YzOMgggTbStLYokpUSqK2Y
         EEFvoerpz7MsK2p2aFhgczzCRQw5yfdBGwLMvzgQ7X9/exIIyMEQukv0who6rLsAJYsp
         Xy6I5oSZF6X6rBk4wgbjkHZIItocP/kR/VwXdqBc3793iFBh1XbAdvPheBTrjxU6tfMB
         KL8A==
X-Gm-Message-State: AOJu0YyY/7+pclzSdawc9TKNQtwjelS7gDm7ZGTbtK78yW5nKl/ubjQ5
	roGjgIPdmf5ErwZUaDWnBKA=
X-Google-Smtp-Source: AGHT+IG6FQg0SPLjELmusCQ1pxaKN/Jc2EfCRw64reeXapXoPt86R09+3G6WZl7C8LMxW86E2RUbhQ==
X-Received: by 2002:a05:6402:268b:b0:554:c9af:a66e with SMTP id w11-20020a056402268b00b00554c9afa66emr13601900edd.9.1704201373893;
        Tue, 02 Jan 2024 05:16:13 -0800 (PST)
Received: from [127.0.0.1] ([89.205.132.224])
        by smtp.gmail.com with ESMTPSA id g20-20020a056402091400b005551b2f66f0sm9627874edz.43.2024.01.02.05.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 05:16:13 -0800 (PST)
Date: Tue, 02 Jan 2024 14:16:14 +0100
From: Eric Woudstra <ericwouds@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC_net-next=5D_ne?= =?US-ASCII?Q?t=3A_phylink=3A_add_quirk_for_d?= =?US-ASCII?Q?isabling_in-band-status_for_mediatek_pcs_at_2500base-x?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZZQDWzYlxAKl0JxI@shell.armlinux.org.uk>
References: <20240102074326.1049179-1-ericwouds@gmail.com> <ZZQDWzYlxAKl0JxI@shell.armlinux.org.uk>
Message-ID: <A660847B-FEFF-4AE1-809B-F0A6EBE2A52C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_051616_915494_29737875 
X-CRM114-Status: UNSURE (   8.11  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since using compatible is not an option and in and 2500base-x is hardware d=
ependant, then I was thinking this would be useful=2E

bool pcs->ops->supports_inband(interface)

I'll be happy to invest some time in this, but I'll need to know which way=
 to go, before I invest more time in something that would not be accepted=
=2E

