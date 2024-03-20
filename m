Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB739C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=; b=0lcj360Mx5bUzyxPPVjhwtMPkK
	ihpwnHUozgMfCTCk+uBn0wgfQhW9CNq/xmyOwhZW6z4GC4NyzPPzsZHhe2LZz8lV4sdYpyLdszoB0
	KTO+iRBXH6X/1JJ1izah6lPUny1mufaQs52CnX3YfHdptY8+i4uthCY3BpyfeplulUUuwES5A38u2
	uxF/YQYAESfwlgzXyVCAZ3dwosFmvhrh+XmP12N1EoJWCgxaB/C38F2KudGG2OjKcigfF/zoeuJcx
	b//tWljNIMLjGWBX2dlYriWuSnaNt4EgF8dop5lld8RpwL8DNo9HfWAnjF31HVS0YazCZn5qvdE6l
	KG+VuMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrbg-0000000GGmY-2uCH;
	Wed, 20 Mar 2024 08:47:32 +0000
Received: from mail.haughton.pl ([195.231.81.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrbe-0000000GGjz-1Ndw
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 08:47:31 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id A331483B49; Wed, 20 Mar 2024 09:46:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1710924448; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=fOfyg+KWydZLS8c+v6tZAyPiM9kyJX2pP/tfMvYNwz1aWD8ENs8XeazNHHimJVRR5
	 pZ+dV5QIkrmD5FB2+fH7R/yzaTL/b8Wsic1+FtDEJNacsIYIYlv06fmJBxaiuPdkxx
	 tIuKDxxeT2Tri8DkgYZwKRpvMRGAKQL30lzB9bOQj2jRp74b//9RQOzJHU8Iq+vXyX
	 e/EMqwN1MGTssPOL7k9e25bXhL5mLPWPIuJZy/ajTCjKgTqMVCpoxWO24kMsXVx/hW
	 Gx5HkbBReeh20Yy45rza0KwyjIBM49rfR39jbdnzWO/hcbz81G2QdtuLfqR0aqVD52
	 PqMKcuF1lyDOQ==
Received: by mail.haughton.pl for <linux-mediatek@lists.infradead.org>; Wed, 20 Mar 2024 08:45:28 GMT
Message-ID: <20240320084500-0.1.15.b9ev.0.1wvakf8c5k@haughton.pl>
Date: Wed, 20 Mar 2024 08:45:28 GMT
From: "Patryk Wysocki" <patryk.wysocki@haughton.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_014730_527500_63B753E9 
X-CRM114-Status: UNSURE (   1.74  )
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

