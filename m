Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 10:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B33GeXDlLddyPF/HB41na4OL7L6TQ7KGkaKTFSBaugo=; b=YEsdMwfF4tOFRI
	zm+KVs3mibleLbfhfebKldQ6lvtuWnmksm5ngjsH79rtXus8+1Yp2fa7T8/SJyoK2uJdwizy/BpLf
	TSiTYXdHvzNIbPaYftzGlN7/1YTTCwrNYBHc5cgTEH9QCm7PsaW8pJM0HjtlrIZUtjn7cavoQcMzL
	nptd33jzS9q0/f3EHVgTnpvhE7e82qdlgfYQy2Dv3cDIQYrLIpU1042DPaQ/O/0HKHCAPchzFT8db
	CWSxOQ6EOkNsgJkyBd3ZE3lPKJTZO86pj+uIi9uwo9SJxklbDa9t4AYIV6F2Hgl1xP+lYEdaWD/g8
	mQ4E2MjH2mzQFru/81/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5mNu-003JjH-PS; Fri, 07 Jan 2022 10:22:10 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5mNs-003Jhr-2b
 for linux-mediatek@lists.infradead.org; Fri, 07 Jan 2022 10:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=AYNTNL/S+QFpIYO6a0jZ1apwOzIYkDjKgtgTKBbTuZk=; 
 t=1641550927; x=1642760527; b=vyCZerjA3Ky1LQHGn8S7k+7mlysNvhpw90R7pG9+UJM8GVK
 nTJwTJHXl/4ywLTWHZp09PUJ0gBquyrAGiK9SS5tjTFifSRCzrf2PsOaZb80EzCTLB/CJaRkEK29w
 BndMzL7tndl7umOHFpnXF8oS6znOOAC+uoszVKtK5kkhTPs/HG4+rHL610WsfxPbrW3gD/F4R2Pfz
 MhDRd2MJuKrImBAxznxwszBjIfeFiv3rE1YXF35ENevkY7Jgm7XT1BZgWTZFpYsUpjsUDIFDLebGh
 uRKMp4tWtIqUtvyDc2EGfzq2HdSxUrT6ZWIq0ue43Q1F17NohoGooVoJ/FfvzpBA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1n5mNh-002rqD-Jk; Fri, 07 Jan 2022 11:21:57 +0100
Message-ID: <bbf4b392e557a36f45a8642682512964502a4196.camel@sipsolutions.net>
Subject: Re: [PATCH] mt76: mt7915: fix a couple information leaks
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MeiChia Chiu <meichia.chiu@mediatek.com>, Money
 Wang <Money.Wang@mediatek.com>, linux-wireless@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Date: Fri, 07 Jan 2022 11:21:56 +0100
In-Reply-To: <97dbf02a-e3c7-aa4a-c404-45fc6189dc10@nbd.name>
References: <20220107073609.GH22086@kili>
 <f61c6a25c7ad1ed452b4facf38c7e451d47c5dc0.camel@sipsolutions.net>
 <97dbf02a-e3c7-aa4a-c404-45fc6189dc10@nbd.name>
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_022208_153124_9BCF89A9 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-01-07 at 11:08 +0100, Felix Fietkau wrote:
> > 
> > Or maybe instead just mark the thing __packed (and/or explicitly add the
> > padding if needed), it seems weird that we'd send something to the
> > *firmware* that has a struct layout subject to compiler/arch padding
> > rules.
> I would also prefer explicitly adding the padding and leaving the rest 
> of the code as-is.
> 

Arguably, if you add padding explicitly, you might want to also mark it
__packed or add some BUILD_BUG_ON() ensuring there's no more padding
added by the compiler because of weird architectures, or whatnot?

johannes

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
