Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AF3EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ2M7oZy09pQU7Rc+HwKVL3JXlQRCY+27o6eYDiCBOw=; b=C4gBcnCCwXQU+c4XSXcGALq8Cr
	z7Ti7WhHJnvpcFpGzbrFpGBDKeyoygK49q4b/QR+dSKahRH07pUNyqQZcyufPFSrwob+TaJv8GSb5
	3ooZ22OhVYu4ZaZQc8aHCr5ReSePUO26SsFiS6oEvZbs4gu4IGUhf94H140JDw9GV8VQ2M8muihFz
	3qX5k6H+CB+ct4jy2LQIlCeZBVNMOV4XZfjoEf9ABLlz7fDge2DVZVKIsQfiPCle1gg660mTvY4wv
	v16G32sVl1d/Yp1wJaa9KSPEZ7lKkydeafUiTQxpslWrffxYQG4YesW1SJyFbQnjn/GoRdcWquohk
	KYLqwJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoyb-00E1XY-02;
	Fri, 21 Jul 2023 12:11:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoyX-00E1WR-2Q;
	Fri, 21 Jul 2023 12:11:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1FA2761A0C;
	Fri, 21 Jul 2023 12:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6E9C433C9;
	Fri, 21 Jul 2023 12:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689941472;
	bh=hJ2M7oZy09pQU7Rc+HwKVL3JXlQRCY+27o6eYDiCBOw=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=Bnt+PIbFNxpV9C1kCW/sa0AyI247EFlRDV6Wp3WTDuw6HrumMJB9BVFASXgvL8k3m
	 yrF+mzba68CyW9YdLn3EowdoqSdHsViSyDHuJu3+M40mRMkyOZ9MYsL1k48aLHbbvj
	 tSm77yZxLhEp3t+9vrmSSrB10SXdeRXwOJQJwfZtf4BSCLJ7YMrWEEcdOmtjGFuw8O
	 g3gbg3b4jvRFLHF1a4T5VegTOZYPN52jDF+5Gnf2tjKg8VVCvRj9Zb8aZktxG78mvl
	 mKgueMBoZjkffwTjsSW9soJTLDuI6m4r1r4LPhkmJwqc70Rje4oOM//PNfO6zjYJk9
	 uMRFQcPILmSgw==
Message-ID: <d0b24d6d5dd15d80be5b1dcd724560bc5a016c08.camel@kernel.org>
Subject: Re: [PATCH] Fix BUG: KASAN: use-after-free in
 trace_event_raw_event_filelock_lock
From: Jeff Layton <jlayton@kernel.org>
To: Will Shiu <Will.Shiu@mediatek.com>, Chuck Lever
 <chuck.lever@oracle.com>,  Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Date: Fri, 21 Jul 2023 08:11:10 -0400
In-Reply-To: <d50c6c34035f1a0b143507d9ab9fcf0d27a5dc86.camel@kernel.org>
References: <20230721051904.9317-1-Will.Shiu@mediatek.com>
	 <d50c6c34035f1a0b143507d9ab9fcf0d27a5dc86.camel@kernel.org>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_051113_849596_BF2821DF 
X-CRM114-Status: UNSURE (   9.92  )
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

On Fri, 2023-07-21 at 06:34 -0400, Jeff Layton wrote:
>=20
> Could you send along the entire KASAN log message? I'm not sure I see
> how this is being tripped. The lock we're passing in here is "request"
> and that shouldn't be freed since it's allocated and owned by the
> caller.
>=20

Nevermind. I see how this could happen, and have gone ahead and merged
the patch. It should make v6.6.

Cheers,
--=20
Jeff Layton <jlayton@kernel.org>

