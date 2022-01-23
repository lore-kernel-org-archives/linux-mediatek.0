Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jan 2022 06:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1q2hbrW5nSoFLtitILNOV08Bp1LIQ8InipNWB0Ght0=; b=sBCrp7VOUO3nl9
	mi/CfGVGMYXaQP2gQcWgWDqu89S3344yZzYPdjU4H00famfS+t5seiX60Mw9v92FK7Cuc39soRGE0
	/x7H4UMQ1lCg69fmk35tG2Owe3RH6uRQwhVpdN9rXVr5mJMQqDJKLeJruDmnYFfpKEIh7E6fXS4uD
	/184Iw9YyV5DUNtMthum1J+PXKvysIkyOkweMejydbYju7OsvAk9ZCIAlNhcspcHtT83mAjdNV2la
	HNg+sL1oOtKBdb9+LgGLxsvZG/TAYfFa1iUeXoRjQ0ZDgvr9K8kiF7PdAgdQ8pcFZlGlMOFjiPXOe
	8ogwjx/l+SikeNRqTozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBWjJ-000OXi-Sd; Sun, 23 Jan 2022 06:52:01 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBWjH-000OX5-Im
 for linux-mediatek@lists.infradead.org; Sun, 23 Jan 2022 06:52:00 +0000
Received: by mail-io1-xd35.google.com with SMTP id h23so15718210iol.11
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 22:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WkZMiG5mcgW7ss23YttlTYu8gm6xX9J+Ar8QWBIEq5E=;
 b=oaGUog1/7hTx8dmo7yRpesIsc557cfGEbHJnjvr9c5hMiQxA6u05aGKiYyQUQspRt2
 4ON7TfKiiBQ9z3JRQne0AVzVNiTdvWZ1T8zDPMi4wi5zgBJwtsFZSFNnVplwvXvkEbU6
 GfXTp3C3z6JM4Eeb33vqb3axHM7HdOiCQv27t270yDNymR1KGsnUXrQYymTeEc1MxoW8
 0wLYTubxTuzbIL4z/Q6GyO/EuG8rNEd+5oiD44+n/qW3pv3gIjoZQFFZj9W7YNM4qqkt
 Tcxh9NBFsF54VodsP4kaEylPtly4Y4DBtdm9KATvWhN1rMbTA7IUEljXf3m0nZrepK5j
 nipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WkZMiG5mcgW7ss23YttlTYu8gm6xX9J+Ar8QWBIEq5E=;
 b=ocn9tLm8S1ER+dun8T6t6hcEMW4xM9g7rJ2g7aEdNQNKiMUwfJYZysP1MwklCzTsHn
 1hDOt49KRnpXNOsMz48nrPi2Qo9xtKJqtbn9GFGe9eGaJ+0Pz4z20khIvVIJ1E2vI5xG
 4Em/uGnUgDW4mlwhCtPUOKKInOvDIoNzvMbFAfqKhBEWP+BqgTHpZ3MNJuB4YIdNW4a4
 PfRX27x15S1O7PoAtTjJ5NkBr8yp3KkTgJxb0APvmIJM6d6WIr8//qgcQzvEAQkgpJmo
 dT58JqjHCXyslrfeHi4MuFcSe0RNjbQ+xpY48hDlfzjNEORdLZb8SOjtNyLH9CYv00RQ
 YU3g==
X-Gm-Message-State: AOAM532wI9mNw7U/Xu4IIH8Z7TqVd792Rby6NA1uCqEYlt0b4AM0yYC5
 STZ1vUS9ExjyB4LDncIOX2DFexdoyNYpU6ABewo=
X-Google-Smtp-Source: ABdhPJxkBxF5q3v2SWo90VE2ehQ+0DAwXb/trW2iTsTGxSX5CvWk1idKDUqv5e+Hryd2YRQH8FamR8EZJYbiFcBqkEU=
X-Received: by 2002:a5e:8201:: with SMTP id l1mr5502209iom.13.1642920717009;
 Sat, 22 Jan 2022 22:51:57 -0800 (PST)
MIME-Version: 1.0
References: <83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com>
In-Reply-To: <83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Sun, 23 Jan 2022 14:51:46 +0800
Message-ID: <CALW65jZ4N_YRJd8F-uaETWm1Hs3rNcy95csf++rz7vTk8G8oOg@mail.gmail.com>
Subject: Re: MT7621 SoC Traffic Won't Flow on RGMII2 Bus/2nd GMAC
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 John Crispin <john@phrozen.org>, Siddhant Gupta <siddhantgupta416@gmail.com>, 
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, 
 David Miller <davem@davemloft.net>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, linux-mips@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, openwrt-devel@lists.openwrt.org, 
 erkin.bozoglu@xeront.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_225159_629212_801D6AFA 
X-CRM114-Status: UNSURE (   4.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Do you set the ethernet pinmux correctly?

&ethernet {
    pinctrl-names = "default";
    pinctrl-0 = <&rgmii1_pins &rgmii2_pins &mdio_pins>;
};

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
