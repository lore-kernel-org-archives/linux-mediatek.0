Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02C9C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIIDnoB2Ay5t4+Uuyap+oXW0DShLR4A4P4w7d/dKgts=; b=p3PmiPxqVsqipKI47DQ7Rih9w5
	lUIIgk4zNpkgNOEcbs0vRoABRVWley0T3U2upRylT42mZ0JVaHR0L6q75fsDycoFkPOhTqUhdaDY9
	5mSYczGZRJOwGJka8L7FyRiMueiXrE3BDgyMH/m7u0u8ftt/O5zKBD0xnQ4sxd2upn8O1meFvBXyh
	zpVyg/s0Eq6MeGn19R1UwLriN4E5lKTx13zAnactD5bQ5nwrRs5OQtvCGlSVLq1LUQFn4A/JEQHiW
	eUTfSwlfJk7prhqeUsWvizjcxIZ9GhL6YrYumY2xjHxGfS8UUusCyM1na+gqTaCcL9vKan/e6212F
	DHbV2X0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY4m3-0000000DwJi-10fe;
	Thu, 08 Feb 2024 13:49:07 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY4m0-0000000DwJK-3lJF
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Feb 2024 13:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=YIIDnoB2Ay5t4+Uuyap+oXW0DShLR4A4P4w7d/dKgts=;
	t=1707400144; x=1708609744; b=cMFfTb9PWn1DnhvZEDt98UOfxMaGx6STwu+GHZ7VKTyIAgb
	2rylVT8S/W8K7qg9AvRRo2wh1krejxOv68yUCM4ouLxqIPB1GOV3I/gu5wo/MnSRnBn3M7kawrvb2
	W/7ASsxVRzdCrTW/+YScp1n72WK4vFyVO7NEIyneIjMWzbxnn4jmDiudDpUuktzV5yawStZZi9/dj
	jDIbhqfsOcNH0p7N/fD8KI6O2OsrYj0/jKzawlrRXO5hnf8mKU6EJj1oLYsWRlFJwBTYQU7qlavjz
	1Ycd0OqXNzpkX6KOggmVocuDAQYm8tLfVD3XXtEFSB8QpOAKEQg2O166ED2jVTyw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rY4lx-0000000HUw1-0aji;
	Thu, 08 Feb 2024 14:49:01 +0100
Message-ID: <2ef35ead3540cb1b19cde635631361b57bb8b189.camel@sipsolutions.net>
Subject: Re: [v4,2/2] wifi: mac80211: refactor STA CSA parsing flows
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Thu, 08 Feb 2024 14:48:59 +0100
In-Reply-To: <b74f21d22a41b2ca635e64f04c06d5db6d38d920.camel@sipsolutions.net>
References: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
	 <20231222010914.6521-3-michael-cy.lee@mediatek.com>
	 <b74f21d22a41b2ca635e64f04c06d5db6d38d920.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_054904_952836_E2233DC9 
X-CRM114-Status: UNSURE (   6.42  )
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

On Thu, 2024-02-08 at 14:35 +0100, Johannes Berg wrote:
> Hi,
>=20
> So ... I foolishly applied my other changes first, so I had to rebase
> this - please do check.
>=20

Oh, also: some tests for this in the hwsim tests in hostap would be
really nice, though I don't know if that would require extending
hostapd's implementation of CSA first ...

johannes

