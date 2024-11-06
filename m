Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A85D59F60
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:In-Reply-To:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li6C8f3t3SYbgMpO/kXts/p8GR96Pv4j3k0vjuIusI8=; b=VaXjpzjhNFA5rBbn8iOjqkj0aw
	XPmlhVG+MX+gG1mIXiarPTH76MVEf7VDfuf6BKpb0y/xupYyyGN5z9L4rcR2OGK+CmfkzKlFUEZzi
	iuPLeQvWm+xN+mkRTWGP6X67ul1vN6DLQdfqoQnMtdyAbe61pdOloWgjWJLGocW1NhqzBZsHLq22J
	Q+4WSVdrpvyFJ7FcPri5Fi0TO8yR/Kwsac4kg9SItWHfDlf81EGfuUDHiB1x1KKzf1b0ZVeHgsctq
	4AJCeysAdfiVOwaRnkuAnFFycEnRneCdfVO2CUAeRUbqIc1jwX92KMkEy+qH3oPj5JZY5twrbCVGm
	zUYiNc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8l6D-00000004Okm-27vg;
	Wed, 06 Nov 2024 18:49:49 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8l69-00000004Oju-3V5i;
	Wed, 06 Nov 2024 18:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1730918976; x=1731523776; i=frank-w@public-files.de;
	bh=li6C8f3t3SYbgMpO/kXts/p8GR96Pv4j3k0vjuIusI8=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Zhtz1ZjVOmW/RaDQV1THforkPHmN56+jsPkuY3IO1PPsj/x9Q4EUztT+4gSGdPlN
	 pxX3XQpdtgF8z0wKMxWd4/I4oJP2h5GWmzRvrjHF31uxkQJwHJubWH3gP5fKsl2d+
	 IeFUhPdNC7Fjk/0hQjCeOsKy3QpZsmxcvjPEEYOAA05dbHyr0MvDv/CgnqyH/+qQl
	 zMgoBWtQlNKg+OUmDT9rVWWo7rHMCTPBTlWPl1q2x4AGut2QE4hALIaj2Io1Rmbjd
	 j5PQfJZLqx9MzxcACE8upxBzeJjEHgDevlO3iclRpceERarm1IKOZRCya7kN6rOJD
	 UtJ/AxWNeLjtq0Fwow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.145.66] ([217.61.145.66]) by
 trinity-msg-rest-gmx-gmx-live-c75c5fb4b-p29nc (via HTTP); Wed, 6 Nov 2024
 18:49:35 +0000
MIME-Version: 1.0
Message-ID: <trinity-ef654aa8-f10a-4195-82c8-65b3ea654c7b-1730918975868@trinity-msg-rest-gmx-gmx-live-c75c5fb4b-p29nc>
From: frank-w@public-files.de
To: angelogioacchino.delregno@collabora.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, daniel@makrotopia.org, linux@fw-web.de,
 leith@bade.nz
Subject: Aw: Re: Aw: [PATCH v3 1/2] arm64: dts: mt7986: add dtbs with
 applied overlays for bpi-r3
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <CAPDEroWUeR3iUFnjVr6WFLg3=dkML+5cbRPph9bj64F=zc1UWA@mail.gmail.com>
Importance: normal
References: <20240608080530.9436-1-linux@fw-web.de>
 <20240608080530.9436-2-linux@fw-web.de>
 <trinity-82c94d49-2a78-4470-83cd-3c6747e01849-1719434738199@3c-app-gmx-bs52>
 <726f2ed3-675f-45e8-94f0-d392181e7f92@collabora.com>
 <951E802C-1B53-45C4-B3E6-4A3400F47214@public-files.de>
 <CAPDEroWUeR3iUFnjVr6WFLg3=dkML+5cbRPph9bj64F=zc1UWA@mail.gmail.com>
Date: Wed, 6 Nov 2024 18:49:35 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:04HA3rCBFobkKgyJv3PRzaWDTdIiPv8aXPTy1/iJeSgOHSEJUK9hCVHSD0wn2SSqhizMD
 BevU1VpOn8iWFu/s07qAKuNevpeLaJKGWlDCyOby34HfK6pyfLyeR2LuHLLwv1u3hD14BDfsaTQ7
 kcgvrKBmvIignRFMW2hYJ0/V+ejxxM7rUvgx0uWEWJ1J7EYsmMiDtxAguxMXnlwE+0Hwp7rKP1DH
 brAeezdmDRhJwcVWEjT6xhVcGyV5ppFuTdkON75qlQpJLixEaU+BLwbWQy7+/egEPEisDSCI83ft
 3aH8fcxuhZD6XsiVXbZKih+kPSNPKBuu0O9/un9YC37QVP3QMYPwryNmXpBQClS4u8=
UI-OutboundReport: notjunk:1;M01:P0:yLAILKCPSGk=;y4s2SKxblFf6I2c5Hh1WGxagP2c
 s3/HJr7M4R7iAGmMq7wRDbectAnOyqDRVNxXS6Xzt3QKbnwWpBSqY9uKvjn2bw1sci1ZyiVUT
 SjV85xR1mL1AxO6MTboC/ZaEeSdM+3Mk29biW/Ub8ZFeVxLR2sQYti0w8jMlnaJnJy2aQvo/v
 6VMyrzcAceMplQ2fa59EyVxw0HusL6QoVLxm2q1nNL1CWLPZyzS9Stw6jJlONtIogHah1slco
 tTQWnfNCmeAd00R/SPxPgMWW1+M61D1snxM8r8RNiCIIKPDOcQMXiR71F79LZ57uLJ4bfGECj
 fS0/quA302g+2RZRHfEhi9MReQ+gqmWDzFS356kdkNOHXtCJS2OT2BntjC++Dlr4cD4BwxrNI
 t2km0ERAAngZR6sR5qfAjQlrgcBxjYxd4wbvNkjSU/ejtwocRKsFT41W+6+7uMzsJzroj7Vs7
 xPo9fmkTCG++dSTjMtk0koV/2pwtUoowt8+il1W2+8Yeru1LLvNbIHZH+Z2LFBreBUgXz4tYs
 LEf212+L/Bz4dP3ofsE+su1Za2YLt/hdd5TDy5T9ooimfTcc+sjMdUctNyhwqiQH1aG8yqtpN
 06aXaiDnjxP7VXBTSEo3JuM8AE8c1KnsgPV2BJ2RPSiCdXUt1/ZSGEPfc62WLzVNfzbYANABU
 lMC1LJdN9+3XCAYmkHNinhbT/qUKhDWzeD1E3f+wBA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_104946_258749_62448D44 
X-CRM114-Status: UNSURE (   4.20  )
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

Hi

any new state on this??

https://patchwork.kernel.org/project/linux-mediatek/patch/20240608080530.9436-2-linux@fw-web.de/

regards Frank

