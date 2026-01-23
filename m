Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9681FD6CFAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jan 2026 01:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64Dv2Q73LpzBvPArXPMCYu6WRRtSWQKGL8gHPitpMsw=; b=oLlmL3UuRZmrYeCwCRHCkJp6q/
	UWUjw5MYxnFLKfLqiur53UmGLC3bstC0aRlAnqoz2is0YieG9dv7AWLWlHwkzigVpJ+bmNocNvRhh
	bKEEvJKqTjO/Acd9kQez+8MzarE3g/TCH646Cz+GyFdjGOcgwkpMYZtO8KsXP3PRGWZiJAq3i7WxN
	Dgj5TFO9Jjn0tZ55iagZvIr0g5sQgOjh9tgBlf94lQWhmHWwlbzSEd7iWqNxh98yNvTJOP9NSFO4S
	Y8Gol7xvrNzcz25lNkq93TwrwDK1L9xKoXQ53fZcC8aWOJ0hr+TUZmTikL40HdqmBZ7dZlCaSnXaS
	wkpA2sIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Fh-00000007zSw-2fUS;
	Fri, 23 Jan 2026 01:46:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Ff-00000007zSJ-2Wvp;
	Fri, 23 Jan 2026 01:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBB5960018;
	Fri, 23 Jan 2026 01:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971BCC116C6;
	Fri, 23 Jan 2026 01:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132778;
	bh=64Dv2Q73LpzBvPArXPMCYu6WRRtSWQKGL8gHPitpMsw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LiA+Ng5HEHFveXvi/29UYw8nH8zrjoZQkFmDBi0FYmn1fC9r9PKkVFk3wqIg2lUaW
	 XHGhsP1I3G52hceAcQjwaIUqqLGNh3eBtLP2evv2QQ9a4M3ThCRlfzlLtN44dJ3iwV
	 oGXh0uuhXqKuAwHdo5u1XFK29m0P2WADuBLSLO/0DqLYhYkj8p/A0hQIB1bVDTuNl+
	 /Ng0hz/h1VLYMuqgWrPXuV/RCkSW9awWWhZQBG5nxTNb/0WrlIte0X/VAE8YOQDP4x
	 Sh0eexYFrtfXuL7fFE3SD2Pj3QuxsTDyJi6/Bx8tPFJNKoH7eMFKK2vbG5OboHg0jV
	 WdER+C088v7tA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 22 Jan 2026 18:46:16 -0700
Message-ID: <176913277684.4027.726770744275023765@lazor>
User-Agent: alot/0.11
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

Quoting Bartosz Golaszewski (2025-12-22 08:02:35)
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Applied to clk-next

