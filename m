Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1458FC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=; b=A07D5nlk2dxtVO6xRYCIyZ3nSX
	HP/OwhKlW2/S9YHMH+d413udsRTmc/Ey8d/TUztcAw5lw15dKlItCGgMwnvY/b9Ua6DWctOz9zcDu
	an2tl19vx7mXhr8Ht9AQGpmqa8ZX7InDvjeI3UHxAueljOn/+vYMfuaXp9+uM9mWZR8nQhh95ohQ0
	zNy86Wt0/mmwNRTRidC33a4ZRkSBd3c+1sS7NlqQUdxlivbYh3+PZRuuXSaqNRhVtV0bj8dKd09EF
	mZPEr5k0tb3nBLdl+iZlG7enf2nnaejMaBm9LPv78ppKCK5+4lfsItcSrwisVmsXlUB1GBmLC638O
	r6KjsRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XZr-001vEW-2C;
	Mon, 27 Nov 2023 09:06:51 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XZo-001vD6-1i
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 09:06:50 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id A76592397C; Mon, 27 Nov 2023 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1701075959; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=fGAB/U1iwoSCroAKor4o2KuKACKwWtI1k6eMHQNIeFTN3ZnHMEnj8kVDFgv9iLGFx
	 5I4ruMH8qpdKJ+MTAMGF2xVFYh08SVM/mbKcbVX1+Yl6OiDEfwwgpYtNYL1NJepGH/
	 neEsuYMdCbwWi1iIGNt2wJOVVVPY54R3eI/IcQrI+zhHyTRWbD2yMvpUcIhuuM4b8J
	 lwmnrcFNNiKNJo+nbm0dymMux20SNBJ9TrmnMC1uN/efL1iVaAt4bQ4rqqbyugABRh
	 +5PyEFySf+hyaO92zvU33SnxK/vIC5412wMGKRIyCf/juNDVnba4D+VRNZHS9/OY5p
	 qz4TTbtn0QfhA==
Received: by mail.thrivehub.pl for <linux-mediatek@lists.infradead.org>; Mon, 27 Nov 2023 09:05:02 GMT
Message-ID: <20231127074500-0.1.35.1bq64.0.gsiuajgqla@thrivehub.pl>
Date: Mon, 27 Nov 2023 09:05:02 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_010648_852196_0D3D85AF 
X-CRM114-Status: UNSURE (   1.38  )
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
Szymon Jankowski

