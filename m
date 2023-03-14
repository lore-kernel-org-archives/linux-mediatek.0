Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9381C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPErrmfX7RzbPKHNnUerrbkZQJ7vI3D1tDNrwx/mxMs=; b=Ccpn5p/sKqLL/hvsLMiOIb5NQE
	59ppTO/znXZ1Rc33KV8PTOHznt4xfQdXEDfikNtXXQNbYn/9yPYny1Hhgrp0Aq8g+KoaAFU+KVK2v
	Zjgsh/N2AE+82ZGMoDVkF4E+/IBVKA+T2/qmSNj3pdheHPUyuXFQdXboGKaLsjZ8EcpA5EplB7sad
	V9/hk4AACybP6BNyKKQWPXQyGuUJn9RgiBFZ658JA2WVQ61ssvuyDbVaAVod9pLKKWM+gK+dTziR5
	sfYwGw30b6J3/daZHLsJFkyrzoCvqvhPzsoxH6/RjPfJjH9mPfZBQCPlJ6PaSYntp88hVdsTc0cTJ
	kGeaMhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbzJV-009OJ8-95; Tue, 14 Mar 2023 07:43:17 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbzJR-009OIX-W3
	for linux-mediatek@lists.infradead.org; Tue, 14 Mar 2023 07:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OPErrmfX7RzbPKHNnUerrbkZQJ7vI3D1tDNrwx/mxMs=;
	t=1678779790; x=1679989390; b=X3POOORbgm8Uk571MIB/Vt/pqFW2fTVVYS55TIyVuAKTrJB
	1fXeZUHUeXmaSUuZ8OcmgtXdIQNEarw7KQipOhlMUArOlXaIN1woxbVYqCwOyP3A6e6DLcikytL0X
	noW2SMmaMbSayGzNFw7/cDETW6BtnxCeuUGFT2TWuYAq+6BCICon3/mxUyhivtJWCw3ueqYt1gPwv
	j0Jjr2+MrJRY8LjVLWQ5PFT7AFgaeHPAX2CyOB0IYwx4qftgcF1fWHozAkpQJm7WVnNFg3CxSwlKt
	XB8k1VnukoYs1nqNrxKpbzpDSxrA6hhmcIB/10I19Qi5IkqIcKMwDXvF6lC6wI6w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pbzJH-0033bi-1W;
	Tue, 14 Mar 2023 08:43:04 +0100
Message-ID: <386c21d475215c95966bbac6b0853e2715081789.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: check the control channel before
 downgrading the bandwidth
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-cy Lee =?UTF-8?Q?=28=E6=9D=8E=E5=B3=BB=E5=AE=87=29?=
	 <Michael-cy.Lee@mediatek.com>, "linux-wireless@vger.kernel.org"
	 <linux-wireless@vger.kernel.org>
Cc: Evelyn Tsai =?UTF-8?Q?=28=E8=94=A1=E7=8F=8A=E9=88=BA=29?=
 <Evelyn.Tsai@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Shayne Chen
 =?UTF-8?Q?=28=E9=99=B3=E8=BB=92=E4=B8=9E=29?= <Shayne.Chen@mediatek.com>,
 "nbd@nbd.name" <nbd@nbd.name>, Money Wang
 =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=AE=89=29?= <Money.Wang@mediatek.com>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>, Ryder Lee
 <Ryder.Lee@mediatek.com>
Date: Tue, 14 Mar 2023 08:42:59 +0100
In-Reply-To: <70f19f86043750c8f164c316496a8690709fc062.camel@mediatek.com>
References: <20221222091354.14050-1-michael-cy.lee@mediatek.com>
	 <277f8db1f790931aaac0f94ba0ea69efcb6ba3ac.camel@sipsolutions.net>
	 <70f19f86043750c8f164c316496a8690709fc062.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_004314_052661_02572E2E 
X-CRM114-Status: GOOD (  10.31  )
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

Hi,

> To deal with such an error case, Extender=E2=80=99s STA interface would
> downgrade the channel bandwidth (from 80MHz) and run
> ieee80211_link_use_channel to check again until the bandwidth becomes
> the minimum 20MHz.=20

Correct, and then it fails.

> Since the control channels are different, downgrading the bandwidth
> cannot make ieee80211_link_use_channel to return 0.

Right.

> Finally, Extender=E2=80=99s
> STA interface bandwidth (ifmgd->flags) would use 20MHz afterward. (In
> the current kernel version, the flag is link->u.mgd.conn_flags)

Also correct, but does it matter?

> At this moment, a hostapd_cli channel switch command might be issued,
> making Extender's AP interface switch to RootAP's channel (ch36).
> Because the control channel now synchronizes, Extender's STA
> association attempt succeeds. However, Extender=E2=80=99s STA ifmgd->flag=
s
> remains in the fallback state and thus the operating bandwidth is 20MHz
> instead of 80MHz we expect.

So ... still not sure I understand.

Are you saying that

 1) you have a race, and hostapd switches channels while the client-side
    code is in the middle of this loop?

or

 2) the ifmgd->flags are not reset correctly for a new association?


johannes

