Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983ADC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHPc3b2HWDj64ive1dxruS27O95C6egAy0HbP5aoRrw=; b=GjAtc//qJDVgtM
	w0m4DXzrXkcZ2UhEVnXkIoahfn3Q1Bto1RWhJyiWFVAGVFQ83jZwEOL5NbJPhafCYIlBhhCV5uw3q
	HsQc8OSJF9uAdbRiAazfKpaslBMRhVcP91GbKeeEbU6veYrbD++oLrdQhkxBv/9ZkpeOU3IjGS6i9
	OMNWYBP140zntHQvD1xAHsE+oSdqOJTONNouotr2fd2wzR0FDw+Lo7taatNKxZOSRyN2v6OdATqOQ
	HwogXPghmCZIttsHvuVWZajc3JX+z9vW25yXVkr+67gxAJ0FbPxq6XFJYdFTz8rNo7nwij8yHBkT1
	DQhgjfVwlH0X3e5RDGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKdva-007z7N-1c;
	Tue, 02 Jan 2024 12:31:26 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKdvX-007z68-1n;
	Tue, 02 Jan 2024 12:31:24 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5563944b3dfso1535846a12.3;
        Tue, 02 Jan 2024 04:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704198681; x=1704803481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IHPc3b2HWDj64ive1dxruS27O95C6egAy0HbP5aoRrw=;
        b=ZXuSS6MdDO5DXR2r4aI/raOLMejR8v70nNvCfW371KEHTt+BZkWHQYX+JqyYrnbpKt
         RPKBq2YxhFgtES2I0N0Q/eqLXopNz7ry9BMerXoS6wKnYjVY9s4VsPv+Giw5vQyLHwU/
         ikmVbbdORksEGMRcisxxBvOjM+9k7WxJUMB8s8PHUrwPwb6JeKV1KjhfcCww3H9zsWCJ
         iSOok71xYt5Fm2Y2VpdGaquLPaNLMB6DRs2EuueTv3F6G5v+emCglIanSUA2BlrhyMLs
         NoG0wJIkX74xhqXU5oao0Fi+nr/aec2fbGimq8IPiWcNlnQhrUHW8HanpugYfo+E8Bnu
         WgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704198681; x=1704803481;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHPc3b2HWDj64ive1dxruS27O95C6egAy0HbP5aoRrw=;
        b=XVprQgR6VqaIB2kR5A1qME70r+R7AVTgWSYqUePiLFBabuO+bw5pHJOGPBI9F5CBnX
         AoS0bqB+2Rl8O2qiJLoPuHPN2j5YBJw0xdbhx5HrdiMaOjPXETmWqOzVS+FGKxDYp21m
         R4qLENw6O2foVDfxvCeOM6NHlUcjbbrj5mVnLs0b2hJ+7++ZtfyBLwyFmti5oS/M43OU
         YnKVddqp6zoWoFtzCuqzct4XbxGCQzR4t2opYKCyF9Ic/JIKWY4aiRko+jGJ3cNP85gF
         takzfJu6bcQLw/m3HlIfQq9nEs+mXaQrQvKHWHryjj/Z7jZPnoKt98Birmj1CnXIUEy+
         h2Ug==
X-Gm-Message-State: AOJu0Yyr4g0d/IVHH6T4eswTE06Y6zSumpH8zNBAUiWTNEOTv0NrP0ox
	vvb/msSb6nN0y/MBekev1IQ=
X-Google-Smtp-Source: AGHT+IE5nNxiH4N4H3XYyngTXfeHYH+ZvpvSr+ySRPH/c+vEoh8xCXMubbqgN3AcbmawlQeXuAC8Xg==
X-Received: by 2002:a50:d01a:0:b0:555:485:4e32 with SMTP id j26-20020a50d01a000000b0055504854e32mr7006623edf.10.1704198681288;
        Tue, 02 Jan 2024 04:31:21 -0800 (PST)
Received: from [127.0.0.1] ([89.205.132.224])
        by smtp.gmail.com with ESMTPSA id dg24-20020a0564021d1800b00552cf686df3sm16033923edb.52.2024.01.02.04.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:31:20 -0800 (PST)
Date: Tue, 02 Jan 2024 13:31:21 +0100
From: Eric Woudstra <ericwouds@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC_net-next=5D_ne?= =?US-ASCII?Q?t=3A_phylink=3A_add_quirk_for_d?= =?US-ASCII?Q?isabling_in-band-status_for_mediatek_pcs_at_2500base-x?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZZPq8iMAv3eR9Gfk@pidgin.makrotopia.org>
References: <20240102074326.1049179-1-ericwouds@gmail.com> <ZZPq8iMAv3eR9Gfk@pidgin.makrotopia.org>
Message-ID: <D80A9D3C-6A86-4004-B575-46A980D8BA3B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_043123_609947_BF4EB58A 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sorry,  I'm on Android for now and have trouble find a suitable cli=C3=ABnt=
=2E This should have no http=2E


Anyway, I see now, I had another version which I should have send:


+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (phylink_major_no_inband(pl, state->interfa=
ce) && (!!pl->phydev)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pl->cur_link_a=
n_mode =3D=3D MLO_AN_INBAND)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pl->cur_link_an_mode =3D MLO_AN_PHY;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* restore mode if it wa=
s changed before */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl->cur_link_an_mode =3D=
 pl->cfg_link_an_mode;



To prevent it from toggling all the time=2E So I do need to spend some mor=
e
attention to this part, cause this also may not be 100% ok, if changing=C2=
=A0
phylink core would be done=2E




The reason I do it in phylink, because of changing to MLO_AN_PHY when
there is a PHY attached=2E mtk_eth_soc would not=2E Be aware of PHY attach=
ed=2E

So that's why I've opened the rfc=2E

See which way to go with this in an acceptable way, preferably using MLO_A=
N_PHY=2E


