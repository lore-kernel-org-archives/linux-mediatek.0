Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959B3C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 07:16:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D9620738
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 07:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MYd1isLF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GySG2VhQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="iWnmSmLQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D9620738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHQVsvTXE3LAVpDv3hYzRLsxi2b1eFix6/S1YnOLuH8=; b=MYd1isLFUv7e7aYJPjy0BXij1Y
	2+GqSDwLgK/chO7ZGhbyuUTdAUSTgPCPsbgKY/R/U+MBYhIKkLFM8+a0CuEG3sd4tNK/Mynl6Ukoz
	8M9PDQ6IpN62Sbmr0at5mVkf/PsAs3R3FGqZJJLUixHj5ldz6nipjAIg+3gV+JUqiiK+xOqbvUf5S
	nm/ZTav40/M+45ka0tl23C8fc0KFownR1tha6W+YRDjDpLaqOeks3M5BJ6JE899kkUzwz6G8f+bY7
	wfmwWmmxzflMwCzXwWE1dYObTKaDjjzWkNOqPln9Qoc2xf9JVCGCACfLmFiCMhDATeJN71Ni2s/xh
	J+uWphlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8IKP-0005zu-ET; Wed, 19 Aug 2020 07:16:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8IKN-0005k7-37
 for linux-mediatek@merlin.infradead.org; Wed, 19 Aug 2020 07:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Cc:Content-ID:Content-Description;
 bh=aeR5NAWk9GvqY5ExiGe0pNTIsE1i6f6aXDKgkaroZDA=; b=GySG2VhQazr+SGE2xcovFvKwvU
 Gzq2gEuXrkDlxLyZzxtzOFnUW6mRPAzDECU2uNRw+xMdSQKMTDNjOcjQ5aH6bg02HgWc8998hwkBt
 Fa1ZU7f/U1hDrfkFdGh9iBWEikpkuuEhv3xz9wKZCPHZ7TeuAVSrEBeBWFKhmSAgqRlG+DivpXboK
 8Ms2lhkxJhiOwxpkfZq3+S5IyZ0HoYXhD6+LbNFRHzDoaNhVCC2LVH05Q8Ui8Ewhrh7oONhWeibjM
 kvl1eNYE0kMjkd7/Ct28rkzcrn5e4eidgln/lefCHT8HcBvbZBk1MDtLQKW9FtVVYzjg7U706sLee
 j6CfzISg==;
Received: from mout.gmx.net ([212.227.15.15])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I2P-0000F6-5D
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 06:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597820243;
 bh=aeR5NAWk9GvqY5ExiGe0pNTIsE1i6f6aXDKgkaroZDA=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 From;
 b=iWnmSmLQfDVFQvbhLverfb+18wKDtevOSo9WzoNzGOh/kIFzGejsfDfGrulh+/mV/
 x/BwFqJeavrejgdpXTFkjqp6xcsh7Z3wMoLUT6Sur86SmN5uuoxoosM6D4+gHhdnKp
 ST3caBb4eGlUo/PNWZHZFuyiQYhNz0mEmYx4HNnk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.76.97.101]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatVh-1kfy5x3jf1-00cQZB; Wed, 19
 Aug 2020 08:57:23 +0200
Date: Wed, 19 Aug 2020 08:57:17 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CALW65jZRWwW4DqpsCM9J=GRp6KnxqT-9MHUO7WSRJtp4E9vnFw@mail.gmail.com>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <CALW65jZRWwW4DqpsCM9J=GRp6KnxqT-9MHUO7WSRJtp4E9vnFw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 0/7] net-next: dsa: mt7530: add support for
 MT7531
To: linux-mediatek@lists.infradead.org
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <D7B43478-2396-4C87-AC34-B3DAC041545C@public-files.de>
X-Provags-ID: V03:K1:Bu/IHIqUTm4yca2hrGH3IDIFjEzVSSqRm7EsIW/kcqmaQxCMg+a
 2ZRpTQPWrfxcQ21tC6BoQ4MwDblaO7BliiBnTNWJhDnEeuIdu6+nagjEzcXP5alp7a7d3zK
 nTpSmZ5kgGn30lnlS9CrVcERlfaXtm40bJIg8qCGfzZs9eGlROJTBw8mcG+U1IEe7agTSpj
 i+OrH4OfphOJURxKKJy5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M9XUDqLAXr4=:Jncag9yqGWzyDvRCeFUuf3
 mgTmIBtU20vyYUy4t0LgOpQUO/udLMc1/1yEKlVPu9aK0bAWKO7pw9rkbJupzApvbSwIiJNXh
 0G367ZDXqO9LYi8St8oqblFFKgkiLuptvx1ZHGBCBxP7+wQgY2JjuIRva7rMS1sR788cbi0py
 CEnfofh60XpT4/XdY360q4LiRIu1IA6RsXmm5YC8JRti0QiFnN5DqjO7TWXXYjkzvub5fmQP6
 ThRSAnbUfugbGfS2bbcYuT4Q0HurBqoGNLYv0wfy90bbIPEcjkQ2SdG5w5fwS4fysshSs/dgR
 1llR2b/e9wDj1S/9an5cEu70YJ/lV5ujK8CL+/bI7fmroXcmdscZBh057Cug+Wr9LIpCRc59G
 1eykX9dy1sEhnI/gszfJgTaitpWdDNZhZRkoOy84LQKKzcvD2/Ue0VDvpucIAgoVxsNXt55ZV
 FoBMlUIQ/9woAkjt8uYB0sYDCB1nKC/VHcW6R5Z67r+jX/A54jchDsAMPXzZGA/jrOAIcW6gv
 kbi2l0cZBlDMdlC7nNRHFuP21ORDlm4BsmPdZyADOvGQN4dIIlt5vvh9nQQSV6/10mpMENbqy
 g+byjn/vzqpglEXcK4ARV8kyPIvJRXvutUjQvbvVgMsFQrkyi+gO6UoUD8ApP45+XtZDu0KHX
 oQir2ZCUOyLIQHhB72NWy04Dx0/20QAY0ge+EJCa4dqN2z97PZq8z2nJzXMveTLkp7xdI+15e
 G/v/FYXDi/yMZbRNgYGL6RsgplA9JGE7nySHOnYGEkzpWebpULtRVNNpBvW2K20RXomY4nPq4
 qRtpfu+ZMDduvaoMERamDouPDrjmf11YKjFDtJp4FlhsghrKHJ/bsJD2VFxYpZX7K0+QO1vpq
 9G1NZB7ykmJvKqREf0oeI92CZk6984CMqzbCq4Hltk+llTMeXXVvuD8PVerE0XR4ffDno+pBM
 H1ygrdmr2NPWXRuyNLp+Z5OYi9TQUGgyVRygOStjL0t2d0m3TrC9+wcKltbEmnL/0rLKYb4oB
 3UR17qzM/N+Q+oTzftovSQJILuYfoVWQ/N9mmZn/9Wt2bGlB2QWQ+eRbVm3R6uO1w/bpLG5z2
 TKNeQRWiEiFFqzAcDsSxq0yAD1ZMHp4+dHBsZv/HyX3KNZbX62CoR02T+ehC9L1dcl8ELT8qN
 YqNVSqRAfB8ABWw6HYAMZ++wLzNzL9Uf6Q7RlwF8QCzw3LhO8H796pddzlvafzj+BRbGvRZev
 RPyiW9NMfhiIjhzOXmmwhwPyB9SQij/yP1AKFSQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_075737_440933_D4F275E7 
X-CRM114-Status: UNSURE (   5.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

Is vlan also different?

Am 19. August 2020 05:49:20 MESZ schrieb DENG Qingfang <dqfext@gmail.com>:
>Hi,
>
>Is port mirroring working? Port mirroring registers on MT7531 have
>moved, according to bpi's MT7531 reference manual.
>Please fix that as well.
>
>_______________________________________________
>Linux-mediatek mailing list
>Linux-mediatek@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-mediatek

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
