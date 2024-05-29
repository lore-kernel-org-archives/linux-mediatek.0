Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66307C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hy7OL951zzMc4+HXkALzt9LRZiawYsmWYUx9WMj5lrk=; b=S6Nl1y2UMSH6A5h45JXzU0mrE2
	FzxNUbgsTr5EdGKuBLkhCOV9U1KgfthRT28XrRQ4/MApCkItRZggtcUvTAlsR+0aQbu9IhA6aPT6I
	5zGvug6QLmHcsjLywLGvaP3/HcXyhA1l6kSCY5ZzeMW6mWWBo4YH9+EoBBQlJCW6qUVvzKVxqp9GS
	HOY5Y5oMGvs2rJtxPZvNThMkwMbmrlJCUdM05taqvw3kr9kZaw9xhrtm+Bt8Wf9GBJTb8LGMPEnXF
	fP1+TOfPKBSU/MXhpnzbGVmS10DZBHEO1LgScVml03izzz80+J97ntg09zmTnkQe/py2behGq9jLN
	ckuRYagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIs2-00000004BEp-3lhw;
	Wed, 29 May 2024 12:57:34 +0000
Received: from mail.bizexpand.pl ([51.195.45.234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIs0-00000004BEE-1mQC
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 12:57:33 +0000
Received: by mail.bizexpand.pl (Postfix, from userid 1002)
	id 4EF4CA2E01; Wed, 29 May 2024 14:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizexpand.pl; s=mail;
	t=1716987443; bh=hy7OL951zzMc4+HXkALzt9LRZiawYsmWYUx9WMj5lrk=;
	h=Date:From:To:Subject:From;
	b=phWe3qUgoBELzekFGEY2bLy1imm8dZJWuyYnXyG3Ne/xdGcNunn+zyD6/0DKmPIF/
	 NKM4/4BEsWYqIF++FyTHlHl50pvtZK2BN91swoJp31LqegIqziF7agBnvdlTvcoepK
	 LpLQjsnolCs9jmO6lfmPdIhtRuTt1asmInJJMoE5VoZ2tkoTAb4SPBlTVOByX6dmt/
	 /zDxkoCZUHU9tRB2GlSjxvLeabAXp3a/UH+uUqf0uk+h/htdm5vZZzsQhATPdb0i27
	 Xy0xuEaDUIBiRUVu87XnNhxcezkRgw77Rcdcc4uu4TDhOytjdK/BXzVvlk8iQiaVWE
	 OYIMC2gr3KfnQ==
Received: by mail.bizexpand.pl for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 12:52:02 GMT
Message-ID: <20240529144500-0.1.hw.23eqv.0.71ys695g7l@bizexpand.pl>
Date: Wed, 29 May 2024 12:52:02 GMT
From: "Agata Lorenc" <agata.lorenc@bizexpand.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Nowa karta
X-Mailer: mail.bizexpand.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_055732_631164_D1754F88 
X-CRM114-Status: UNSURE (   0.76  )
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

czy korzystali Pa=C5=84stwo kiedy=C5=9B z przedp=C5=82aconej karty luncho=
wej?

Czy wiedz=C4=85 Pa=C5=84stwo, =C5=BCe aktualnie istnieje mo=C5=BCliwo=C5=9B=
=C4=87 zwolnienia z op=C5=82at ZUS a=C5=BC do 450 z=C5=82 na ka=C5=BCdego=
 pracownika?

Dofinansowanie posi=C5=82k=C3=B3w jest korzystne dla obu stron. Pracownic=
y mog=C4=85 tak=C4=85 kart=C4=85 zap=C5=82aci=C4=87 za posi=C5=82ki w res=
tauracjach, z dostaw=C4=85 online, catering pude=C5=82kowy, czy podczas z=
akup=C3=B3w w markecie. Jednocze=C5=9Bnie karty lunchowe s=C4=85 doskona=C5=
=82ym narz=C4=99dziem motywacyjnym dla zespo=C5=82=C3=B3w pracowniczych.

W ten spos=C3=B3b zadbaj=C4=85 Pa=C5=84stwo o zdrowie i dobre samopoczuci=
e swojej kadry, wdra=C5=BCaj=C4=85c rozwi=C4=85zanie, kt=C3=B3re pozytywn=
ie wp=C5=82ynie na efektywno=C5=9B=C4=87 biznesu.

Czy mog=C4=99 zaprezentowa=C4=87 spos=C3=B3b, w jaki mo=C5=BCna wykorzyst=
a=C4=87 tego typu benefit w firmie?


Pozdrawiam,
Agata Lorenc
Senior HR Manager



