Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9822C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjWAsr+RvOGj+BTsFabySpMvwV1qHn6L4iU1gBJ8zWk=; b=U3qAm3X5bp3It2cDMqxklUWISQ
	gJl9Q+ZUgapLmgoGm8XsAphzH/8sRHagF2vTiYnCGXyClyfOp5lVIFpCE2RsXR4EVmYMrekLLkMqX
	n2/ONmQgwAyqAJ9H8esbWHeESPyK7N5qFyiJj/q6+dnoakL2vNF4HOL2LhDpjEU8wWCKoKTDkpFw+
	pjmASkC1T5JVkKcoE2n/r4QNvzGx6LjL1/nGiWhSl4giK5HgccEtzrhIkUh5KSRtm7eNOw8dyGWOo
	TH7R60K91Fe3t6dgs1m8dzSSP6ffouVL6Ya+NhOxwiXZojkII8HEWB9xpCMKphHRnJCaj8J9kDZqY
	W8qR+4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otTQ7-00Fg2n-ND; Fri, 11 Nov 2022 12:46:07 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otTPw-00Ffzi-EY; Fri, 11 Nov 2022 12:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1668170741;
	bh=qneJJGHoqWYbu5rchBDl5skDJGGz8YlMGk6gDkI/2nk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rPLQNBZZO4h+5oiwI2s2dkXi55MzW4QCr4sgHtnRVk42EVw9x7hUBAiMdi5rJThUI
	 67qgkiUv6jmUSweUtVbp1yUCwc052RTK1/oeN/ZQ5OlX+zjEAGxx0tC5zhOwJtyyPA
	 3KDMamhoECn6W3NLh/mkDCvJ9zdHbjDW3ugczX7OkCe91cEAdBtK7KNDvTRctjuDSr
	 rsxxIBErErvAj3zyIX3YQJmy9sHb6ZHbyTPyxOcvzJ9rFYb7J6WT/X2cbhjtibU3iD
	 iKuSP3YsrTY3bIcWK0yILxwuAJFS/15/+dqJZpssy2o2LUWlDNTacd2PMKMSHyWXol
	 j+WlBOp5Yyz8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.127] ([157.180.224.127]) by web-mail.gmx.net
 (3c-app-gmx-bap63.server.lan [172.19.172.133]) (via HTTP); Fri, 11 Nov 2022
 13:45:41 +0100
MIME-Version: 1.0
Message-ID: <trinity-6bc6a2db-9bdf-460a-a9e5-e8d5aebdc579-1668170741328@3c-app-gmx-bap63>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Shih
 <sam.shih@mediatek.com>
Subject: Aw: Re: [RFC v3 05/11] arm64: dts: mt7986: add mmc related device
 nodes
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 13:45:41 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <9955078b-72cd-4260-0cc2-ba1b9e0a0bdd@gmail.com>
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-6-linux@fw-web.de>
 <9955078b-72cd-4260-0cc2-ba1b9e0a0bdd@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:uVg3wzNrILOD0hMUF9OrIK2sauhiLJ0L97UfHqLn79TwvVMrQmYlpmXGxlzHuBUCoJ/GX
 aUX1+963E5c6LznpCZDV6oSScaJbsffhX1md/uYVYdPbhfKcBwJlpxiAkWpjFMWFEbwqFsu4APpX
 tV1jjb5/5cV6nfHMMs1OfSU197XcBuuzY5DApduT3jySQVptpt2tE1HBScZayl6as/Gpn+XVJv1g
 2jLTHGn5I15xaruDaqGUlKIMpCxkemuOOsS7xROP+7ivAijnJvrRQy6VZPFbWrMkwQsS8nH+7ow0
 C4=
UI-OutboundReport: notjunk:1;M01:P0:rJZgTu1YGdk=;FvoX5LF81jBREy7bE8wHMa7TySI
 yEAocm5OvPnl23qhZLSxMkzctb8ibQbCs8JW+wpty/cqdRqolQGddqFjyDWii4sjgO7UMvlR5
 SfqgUY4VVUEWd+1ffCNcPL4HqUi4s/lY7UpoJIICjMwD1seEtFOwAvrXPb4g1EbCMAdc5i/VD
 TIY+zoRRPe+4/Sc3Yc3FGZ/XYmmJdoWwK5WW7OB1kl9FSd8EAf3x2OqXHBAZ76+7G3awqKLnJ
 Gnn9+EQQ0ezLMvR2sZTYX0WwY2k78OBes4qJaxIcyGVJEjG+/xpu00caKUR2JvKtLsMDnR4xp
 RkNp6LM4h3QKDg/zhyvLlkUQEAG2nNnGFU0Uwc7Q/JIiB8jDe/F/L9ZMCskhjNECSiXBUBzjT
 ny9pbBUlnPFfQb/f51NyvOBR3yBDQNd3LVsyoxyHqIG0gGzz9EU3nDiTllXetNFP3w8qQ5nX2
 Yq4qoZ3sfn0RY9k0nXtY7lm4takQ9/XT2SLaQ5f1+y2jqGIKXjfZ9VAKRbhrz5yNYJ3yRMm5d
 PrepJytUIOz6Iw3Lo8GHrTbEBl8lzDSjDdNBlyC7Kaq8js1+Es7Fl4E7Z2APr/ig1/qDN0tvX
 an1JUQesY6+sKriQqiqea1NJiNkeIWBg06QjDLl1JFFoJ11PcMKzxMyBZmKe0mA/TqG9BYJrP
 9pi1hDCmp+732fTV2lyjf6OylZj8TPWNwtN37R/12Z4SeCB2gI+m6AagcIe1zggWoW3WCJ9Xf
 pllKUnNDwaWItt9HriBFpskVrREQwKlw4ah6V+vfKYVDVoc1Y6vREFXY3S+HfO2y4sBTEv0Sf
 iFew6wTF8aUtRIPZGX2hbN1g==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_044556_787638_EF05BBF0 
X-CRM114-Status: UNSURE (   8.18  )
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

Hi

> Gesendet: Freitag, 11. November 2022 um 09:58 Uhr
> Von: "Matthias Brugger" <matthias.bgg@gmail.com>

> >   &pio {
> > +	mmc0_pins_default: mmc0-pins {
> > +		mux {
> > +			function =3D "emmc";
> > +			groups =3D "emmc_51";
>
> Waiting on
> https://patchwork.kernel.org/project/linux-mediatek/patch/20221106080114=
.7426-3-linux@fw-web.de/
>
> Please correct me if I'm wrong.

this (newer version with some pinctrl-fixes) is applied to linus pinctrl t=
ree

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/c=
ommit/?h=3Dfor-next&id=3Dc115e7f51e685536ecb885854bdd4b3f225ff3e4

> Matthias

regards Frank

