Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA68C83F03
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7agiKvqF+bpeST7/7PX+NCXx5hddm8eGV8Djvzg+l+k=; b=bVOsM6iebeAE1bbKFfVlIIUPEg
	zfE9MMkdSKLKqQJx0PGYFAY9oY7xKyBZnGMI05qu4MNf9iGTD/vE3GI0wicr+NLo77rqgM/HztG7j
	GBEG7xEFep2vniRcPS+J3hQlrGp14SSKDxr8kydq7MSFoziyhxDjrWzqAvOicQhDfnolCrH8BOZvb
	maUJGi7JAJtvdPCLgXH7ky8ce3Rexg55xeUTW5QcaRp3gu1LgbtsNeOyI7P1/X/JKTYRWPlp67VJR
	R8NWbe02Qul7RdVj4JR9QVU8Ijr85yCqhQSlkAc0qgJ3Ly78ULzqddF9ysWasYgdxUI6XTou+JMJ/
	PfhktQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2W-0000000CXpw-3SJl;
	Thu, 03 Jul 2025 21:00:16 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNVC-0000000C62T-09bh;
	Thu, 03 Jul 2025 17:13:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EEBB444FF;
	Thu,  3 Jul 2025 17:13:30 +0000 (UTC)
Message-ID: <ffdf6fcea7730dd24c14404fe219259c9b9768d1.camel@hadess.net>
Subject: Re: [PATCH 3/7] Bluetooth: btrtl: Fix typo
From: Bastien Nocera <hadess@hadess.net>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: trivial@kernel.org, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto
 von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau	 <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa	 <neal@gompa.dev>, Johan Hedberg <johan.hedberg@gmail.com>, Ingo
 Molnar	 <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Al Viro	
 <viro@zeniv.linux.org.uk>, Kees Cook <kees@kernel.org>, Erick Archer	
 <erick.archer@outlook.com>, Chris Lu <chris.lu@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	asahi@lists.linux.dev
Date: Thu, 03 Jul 2025 19:13:29 +0200
In-Reply-To: <6be1c1c6-8d8a-49e3-bb14-dc8fcbfc2c50@molgen.mpg.de>
References: <20250703142542.985248-1-hadess@hadess.net>
	 <20250703142542.985248-4-hadess@hadess.net>
	 <6be1c1c6-8d8a-49e3-bb14-dc8fcbfc2c50@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeifffgheettdeggfejgefgffeguedvgeevkeevjeefkeekudejheetffeufeffueenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefpdhhvghloheplgfkrfhvieemvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefngdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopehpmhgvnhiivghlsehmohhlghgvnhdrmhhpghdruggvpdhrtghpthhtohepthhrihhvihgrlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgtvghlsehhohhlthhmrghnnhdrohhrghdprhgtp
 hhtthhopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: hadess@hadess.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_101338_204156_7F3643EB 
X-CRM114-Status: GOOD (  19.27  )
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

On Thu, 2025-07-03 at 16:35 +0200, Paul Menzel wrote:
> Dear Bastien,
>=20
>=20
> Am 03.07.25 um 16:24 schrieb Bastien Nocera:
> > Found by codespell.
> >=20
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> > =C2=A0 drivers/bluetooth/btrtl.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
> > index 7838c89e529e..3d137944c458 100644
> > --- a/drivers/bluetooth/btrtl.c
> > +++ b/drivers/bluetooth/btrtl.c
> > @@ -693,7 +693,7 @@ static int rtlbt_parse_firmware(struct hci_dev
> > *hdev,
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Loop from the end of the firmware parsing instructions,
> > until
> > =C2=A0=C2=A0	 * we find an instruction that identifies the "project ID"
> > for the
> > -	 * hardware supported by this firwmare file.
> > +	 * hardware supported by this firmwmare file.
>=20
> Without the second m.

*facepalm*

> > =C2=A0=C2=A0	 * Once we have that, we double-check that project_id is
> > suitable
> > =C2=A0=C2=A0	 * for the hardware we are working with.
> > =C2=A0=C2=A0	 */
>=20
>=20
> Kind regards,
>=20
> Paul
>=20
>=20
> PS: Should you resend, it=E2=80=99d be great if you wrote in the
> summary/title=20
> if it=E2=80=99s in a comment or in a log string.

Noted.

