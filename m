Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ED2E77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2025 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=; b=AELJP6Fp4i94Sx9NligttQQ72r
	8XSS9JhZe0Qpa2Z9bS97WHDw1dz9QAyVtaF1NqnS7buhd6P7i3b6cJ2G1MMnTU9B7T4EzmqWNmA5l
	2Dfyhm5xlyJ1xcXajk0kinHgKpRMPs/csSw6VAalDrE/7wQ4QfVvZIimLszDEdqxcyEAUO9ryWcP6
	8OuiU7Yt5kxHKiawYb7+ZKyjHz7T0x8iAITsOwbGOKmHQ9A4vabzTqk6JF2i6A5OSNqKpm27abIxT
	86TeqCcgJGB1xbBS7UkDl5tVCMgXqjVwZaMrrYFozBlBMEWEr4qAoVv/1atpsQ8H8yYG5Mkcm22Vk
	cf9webQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWB5W-0000000Ee1H-2ELr;
	Fri, 10 Jan 2025 09:13:54 +0000
Received: from [217.61.0.75] (helo=mail.taskinium.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWB4K-0000000Edkp-3taA
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jan 2025 09:12:42 +0000
Received: by mail.taskinium.pl (Postfix, from userid 1002)
	id CDBBB847AD; Fri, 10 Jan 2025 10:01:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskinium.pl; s=mail;
	t=1736499680; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=EJu5FZvhQWAcingiahg4tHtQ62k3Qd74hAR48wPryTRz+CiVUqi+RbDgfxkXdMx8+
	 xgtR3ctkm7iSyvZf43tZ5Ue3JAHUet6CPJO2JnQN/bfJZfG49z/R65PdzLDp2P3NSY
	 9dtLvlpGcu0U9lb1Wqxdfpl2MakIHghFHXz3VZHqU2SOTxpSAC37nEAJT9KcwPu+Sw
	 p7k/nGPQX6Oqyccxzz7kXf9mBXnoNl5zFxukzq9V0hDIuD+oZGd7+WeeYk258KpMNt
	 nrEwYvl2RySHJcNlxjZaKAMbfGmS7K4D3dMsgZNB0BIKMl13unWIFI+oLkrbHjolzL
	 MvzC7luHGkuZg==
Received: by mail.taskinium.pl for <linux-mediatek@lists.infradead.org>; Fri, 10 Jan 2025 09:00:38 GMT
Message-ID: <20250110084501-0.1.d.1qzz.0.o2f6e0hotx@taskinium.pl>
Date: Fri, 10 Jan 2025 09:00:38 GMT
From: "Patryk Wysocki" <patryk.wysocki@taskinium.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.taskinium.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_011241_097427_2F83B632 
X-CRM114-Status: UNSURE (   2.03  )
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

Dzie=C5=84 dobry,

Pozwoli=C5=82em sobie na kontakt, poniewa=C5=BC jestem zainteresowany wer=
yfikacj=C4=85 mo=C5=BCliwo=C5=9Bci nawi=C4=85zania wsp=C3=B3=C5=82pracy.

Wspieramy firmy w pozyskiwaniu nowych klient=C3=B3w biznesowych.

Czy mo=C5=BCemy porozmawia=C4=87 w celu przedstawienia szczeg=C3=B3=C5=82=
owych informacji?=20


Pozdrawiam
Patryk Wysocki

