Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B60C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 22:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgTwvTq1JSrz7mNIp0oVdLzTuHaPTbJ115CWdvj3IsY=; b=PBVG59JTklP1ippep4b7TGt2rz
	k/qUBlM4SLGQfoMRdV7GiK3oN1HG6zfffUz9MrMU+pOztg8ic2gkC0AyKQkRHu2kZi+qY9Py+6o8g
	ghwVpC8PbBWz1JWzyn/4Y18Y6TCRvomYwt3ndzFrBAjBtBdgxDhbR5b5HNosUjdBBTQr2oKk3IXhi
	MRefA/1B0mKBg3JlbP+GYmweMnLTybONX1E+de5QxrRFRl9F3cbkplbWrhTUrWG8PRKOnBT7/vtXK
	gbf6OyGgBxfEGqpWiITiJjXiw3qUFx5RAbl0R11CyEbQImR0g7+C3ReNb1C4fDE8NM/9DRGEbeeG4
	b69X2Dug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1iq-005Cts-8Z; Mon, 11 Jul 2022 22:17:44 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1ie-005Cbg-3D
	for linux-mediatek@lists.infradead.org; Mon, 11 Jul 2022 22:17:34 +0000
Received: (wp-smtpd smtp.wp.pl 39402 invoked from network); 12 Jul 2022 00:16:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1657577790; bh=FgTwvTq1JSrz7mNIp0oVdLzTuHaPTbJ115CWdvj3IsY=;
          h=From:To:Cc:Subject;
          b=dGF+JIvhtiNwRtOLhAFoU3bdxIOTiLFqUQqRJ0hYY9kTH2XXPLelltdRlzWJh77Gw
           g0yfU8HALnN7CZ05qIMYHo+BahPsPC3/dRrjUjAAT1x0JJ2pcphq2zLY4+RcY9fBhA
           xxdN+wh4Ifh0/3RF7rWZd2iR5iq/kpSCYRAAzxiU=
Received: from unknown (HELO kicinski-fedora-PC1C0HJN) (kubakici@wp.pl@[163.114.132.128])
          (envelope-sender <kubakici@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <justinstitt@google.com>; 12 Jul 2022 00:16:29 +0200
Date: Mon, 11 Jul 2022 15:16:11 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Justin Stitt <justinstitt@google.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix
 <trix@redhat.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mediatek: mt7601u: fix clang -Wformat warning
Message-ID: <20220711151611.573190f5@kicinski-fedora-PC1C0HJN>
In-Reply-To: <20220711212932.1501592-1-justinstitt@google.com>
References: <20220711212932.1501592-1-justinstitt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-WP-MailID: 2595572855169aaa33be638c199b8625
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [wVN0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_151732_662649_F12D670E 
X-CRM114-Status: UNSURE (   7.70  )
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

On Mon, 11 Jul 2022 14:29:32 -0700 Justin Stitt wrote:
> When building with Clang we encounter this warning:
> | drivers/net/wireless/mediatek/mt7601u/debugfs.c:92:6: error: format
> | specifies type 'unsigned char' but the argument has type 'int'
> | [-Werror,-Wformat] dev->ee->reg.start + dev->ee->reg.num - 1);
> 
> The format specifier used is `%hhu` which describes a u8. Both
> `dev->ee->reg.start` and `.num` are u8 as well. However, the expression
> as a whole is promoted to an int as you cannot get smaller-than-int from
> addition. Therefore, to fix the warning, use the promoted-to-type's
> format specifier -- in this case `%d`.

Acked-by: Jakub Kicinski <kubakici@wp.pl>

