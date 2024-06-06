Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838E9C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 05:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67dVbFD/2DQF9usMWt43fKDwppvEBt20ndKl7bU0GFw=; b=cXiQVgJD3p/H/Jbb0WEnOrKh/F
	EiIgnemo7NQDnH4oxcXnxQPv7lmqHBrPRbZFnddZbZE06eBvUfgztnMYRXSs04RFCP5QGzyuk+/DQ
	mW9SJ6dKb6R7GP7O+54LT9ji7zj3IJiPujH3ZChqFcGz4NDPKuAv/ka1u8CmD+IWJr2D76esVd90j
	VD6ZdFM/lW5keVg0RC5Wj/+9vJ1vLr3BaUN7BTZxOoUEE/Jj11j3RZSXn1EkGmF+V7eRyGi8tL+z4
	FkRCYODlocoOe+E5gEpXRtLP8Gr+WLovHEUt2uKwBEBZsk34XX8+svvTQc0efSvU99TwEdmD30bQl
	S3dX5/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF67V-00000008SFe-3YuQ;
	Thu, 06 Jun 2024 05:57:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF67S-00000008SF6-36NL;
	Thu, 06 Jun 2024 05:57:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-35e573c0334so951700f8f.1;
        Wed, 05 Jun 2024 22:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717653420; x=1718258220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67dVbFD/2DQF9usMWt43fKDwppvEBt20ndKl7bU0GFw=;
        b=SisjLCW3As7I+L+P0x4C1Jqn7iph+EHzcymB5YCqZQQXIXw0McGB2nJi4wqkKY+iHg
         PokmFRc+xbAgGdT21cHfMYct//r3071pYBmiSR97kc126mDa07qpYJPAKLkju0rjIK7n
         0gOda5r+/SUTM1beE/2KhP7hbFnwF4qiH/B2NXK+8K0bzmlS43UYj8mXl5n1wQcsyoPh
         2DHXQc6WzIAHt/KnfjlNeWf+iZBGZbIDsHXYbXPEq+V6ixF+JEdwOVf5j58bEg8kmvrZ
         qAOFZuTIQZuWSs5j/soo3nmDFJE3SOzYnmgGrg2egt+QIZAbc0gCKqOw+FCWDJ0CqVun
         QpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717653420; x=1718258220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67dVbFD/2DQF9usMWt43fKDwppvEBt20ndKl7bU0GFw=;
        b=ojm4OjTVBEbcjvZ3ROmvzb3NVfoj2rIxjlHOzIpS4x+8JihMjkxP7i+q3eFa+R7VHg
         tV/w/Tq/q7hJXaKMX62hVVIqHyzDx56RPDSXIB1GAsg3CbSr7iNYzcUMMbnctb3/DLlr
         +ONVTXCgzgFzDIOMlkRGnk8pw65z1fX5IuXhs1YxQtdSWK/7EShKwxWS8NyswQih4/Cc
         XhroBxjnyHF9fvryK08fHmDJslkgDw+QUNBYZOfIjmPySSXJZbj7d8z2FGbyaQfaBP+Z
         XO+1sptBhkZKMCoV6TED1+QSpk0nXlXmRhfXZH4JeanM+HGrzuU6IxLRi8lT+FCJ1BCO
         2H8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMR/PIj4U+jCS34pDeU9PcD172kf3z+4pwhd69kNDMviekWvHcymrPzEQyJm8r6WDDa7Q6b0yjc5IHnEdyUVoXKrY0+GV74yXK4VgMJj25ZKlGPOClzvMY4ahyZfngoiuvAx92MwLHwh+NcpObVeg/uJQgGN2NWVc=
X-Gm-Message-State: AOJu0YwyPv8l8ZxGkBV/vI1912ji4h70eOVelvWP6Pl7twoFLpBCLPKv
	s962PykktUB51NWRiKT0PoJ4GQLijKFCNx3S+Jr4n7yIrH+PhH0roVacVeETeBagUFQ9Kn66jHn
	wihurA1B0L7cGIsZwuwhLqyPoZlA=
X-Google-Smtp-Source: AGHT+IFZepq3sEeQBCy5kZ48sBUfqe66PfQjpcYWZc5zSawvex/dg7mlw4aaY3fS0I9FAoKhuEtTLa3Rp4N1ejUG898=
X-Received: by 2002:a5d:58ce:0:b0:35e:61b9:3037 with SMTP id
 ffacd0b85a97d-35ef0c7281amr1250796f8f.7.1717653420153; Wed, 05 Jun 2024
 22:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240602173247.12651-1-eladwf@gmail.com> <20240605194305.194286d8@kernel.org>
In-Reply-To: <20240605194305.194286d8@kernel.org>
From: Elad Yifee <eladwf@gmail.com>
Date: Thu, 6 Jun 2024 08:56:49 +0300
Message-ID: <CA+SN3soxVEUUWZHMFX7OeMj56wEw7p9Q=eXXNJwiYz6Bh=pb7Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: ethernet: mtk_eth_soc: ppe: add support
 for multiple PPEs
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_225702_802188_4839A049 
X-CRM114-Status: GOOD (  13.73  )
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

On Thu, Jun 6, 2024 at 5:43=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Sun,  2 Jun 2024 20:32:40 +0300 Elad Yifee wrote:
> >  struct mtk_mac {
> >       int                             id;
> > +     u8                              ppe_idx;
>
> I thought Daniel's suggestion was to remove this field.
> I don't see your rebuke to that point or how it's addressed in the code.
> Also it would be good if you CCed Daniel, always CC people who gave you
> feedback.
I talked to Daniel in private, I should have done that publicly.
Relying solely on ifindex%ppe_num could potentially lead to more than
one GMAC assigned to the same PPE.
Since the ingress device could be a non mtk type, I added that sanity check=
.
I think the additional field is a small price to keep things clear and simp=
le.
(sorry for the previous HTML tags)

