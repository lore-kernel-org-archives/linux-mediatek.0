Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B533C7EE22
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 22:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFjZ1HFlkdOphu8pt3P+AWZ69ukQH9DHAMTAQ/Xss68=; b=IGmQMMENz2fGm0UYdOzxwdw5W9
	1yBsT2rvSQ43UONSmWzMuOrSFVyXSxCaoFbHs4SO0TLSKZl/bwMOmuO5Liyp9tLnBRSrXDw9vYxwM
	KkxVas1swr6saVBjU5wU4A5lFmSvfBSTvPMyssTW5km/kRGj1EfngBW0i+SU60kwFoxrbCKd1X85I
	ff1mX88MUuQHBAjeZWkdlFZtcWFWYCutGATGHlXPWP7V34ydpKYnIbYaPldpJ/sfpW+OlQRMRXkd7
	EYMOYRYj1F4MmWmM7gqLPm56uBCjLjhMBHsMGCDMf8Gh1c3JXYrKNv8ek79wCywT+ItaitURHNvJz
	WzAh8kcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pygN2-003cpm-2M;
	Mon, 15 May 2023 22:08:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pygMz-003co3-14;
	Mon, 15 May 2023 22:08:42 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3062db220a3so8671059f8f.0;
        Mon, 15 May 2023 15:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684188517; x=1686780517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AFjZ1HFlkdOphu8pt3P+AWZ69ukQH9DHAMTAQ/Xss68=;
        b=jCZAZfao+7urCsudftc6jkfDj/2BabReD755Lx3fn1dKSGFE8P+XUhJfetM3lXUVi2
         nFlGkzC8TnCzgHh0vcLQBzWYHNFqtOov8imMrYGlULEXoknHW8rGMvunRZL1c2xqMmLF
         I1ZvGzrSL6Ki+6lQhx9L+RnAJDOAH9yYBBvcn1HbTLsLAm8/O8jmFWjx7VwJ27aJuobW
         MUb7P1xK7oaateQzIODp/taP4UP8uWzHX/hwwhEbp4kqjQn67SWWJ4u6vBTArV/slxrO
         vy42QNPp4T/3l/QrjRxpFHze3XzrV28jubwqbzmH9DqH9z+312yVlzOjv8fLAJACJx3G
         uoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684188517; x=1686780517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFjZ1HFlkdOphu8pt3P+AWZ69ukQH9DHAMTAQ/Xss68=;
        b=f6DuX5LbnEmRC9O6xyEZiINfXPUcApeYTuMfNGGtWP4bGAaglewSHSs8WxMnogDO4Y
         dHQ3vgH00N0WCGmuQzq0s2WOuvclGA590LnP67V211WiQ3SS+UzTABajHhI5B4w2r3av
         +k8Vj30nFOA6sZTHR0fpOzL1ZKNZHTOXxDx8hHaFxiqTMZEWvMH3iVngBvdGcVhDkvKH
         UcpnBPcDdDmSdHZznhlxYtvD5TjDxCaqy7vMHL8w3O+dx606TK9KqMJMpNzhKse86ehJ
         2T9sXuLwfiGr/KRv58Q6PF2w68IYtUMaCy9X/WUWeDM1T+P5duMfVUvaL7vcBfcQ4JaI
         VNiA==
X-Gm-Message-State: AC+VfDz2eDbXghkwWO8Q2Prs42OaxXpRmpLvc3SAdlGqrchtr3Mq0Q4w
	eM2vb8Sqy4XLFZc8m7KNqog=
X-Google-Smtp-Source: ACHHUZ6g223jgjwxElDQeuXepqmkV1hCAf2XwEgxvvDxiNyJ813t9ca04v7vzE7HdERNUFZXrcJ3GA==
X-Received: by 2002:a5d:4b04:0:b0:306:3e96:6c5f with SMTP id v4-20020a5d4b04000000b003063e966c5fmr24691493wrq.15.1684188517176;
        Mon, 15 May 2023 15:08:37 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d6704000000b00306299be5a2sm394081wru.72.2023.05.15.15.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 15:08:36 -0700 (PDT)
Date: Tue, 16 May 2023 01:08:33 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Marcin Wojtas <mw@semihalf.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC] Providing a helper for PCS inband negotiation
Message-ID: <20230515220833.up43pd76zne2suy2@skbuf>
References: <ZGIkGmyL8yL1q1zp@shell.armlinux.org.uk>
 <20230515195616.uwg62f7hw47mktfu@skbuf>
 <ZGKn8c2W1SI2CPq4@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGKn8c2W1SI2CPq4@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_150841_369371_FC3796D3 
X-CRM114-Status: GOOD (  14.88  )
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

On Mon, May 15, 2023 at 10:45:21PM +0100, Russell King (Oracle) wrote:
> Clause 73.1:
> 
> So, my reading of these statements is that the _user_ should be
> able to control via ethtool whether Clause 73 negotiation is
> performed on a 10GBASE-KR (or any other backplane link that
> uses clause 73 negotiation.) Having extracted that from 802.3,
> I now believe it should be treated the same as 1000BASE-X, and
> the Autoneg bit in ethtool should determine whether Clause 73
> negotiation is used for 10GBASE-KR (and any other Clause 73
> using protocol.)

Having said that copper backplane link modes should be treated "the
same" as fiber link modes w.r.t. ethtool -s autoneg, it should also be
said that there are significant differences between clause 37 and 73
autoneg too.

Clause 73 negotiates the actual use of 10GBase-KR as a SERDES protocol
through the copper backplane in favor of other "Base-K*" alternative
link modes, so it's not quite proper to say that 10GBase-KR is a clause
73 using protocol.

To me, the goals of clause 73 autoneg are much more similar to those of
the twisted pair autoneg process - clause 28, which similarly selects
between different media side protocols in the PHY, using a priority
resolution function. For those, we use phylib and the phy_device
structure. What are the merits of using phylink_pcs for copper backplanes
and not phylib?

