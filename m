Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90D6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2fcRFprECSrS9wyUZrKGdNosiqSz1thbwrBYPqw293U=; b=Dnref5SfQ9aZhc
	d3SKj4eWsyXvBS8hTWBGHttInlyvTC9jCunpeAO0BZPyKlbbcXSd7vmhtG+5qR0jKZTU96Lz3hfH1
	dGmHQy7w1WrFppeWeQGW7e34jAQgud0eJxW6M6G1fGX+0N55vpPmV/i2qswcdVl6QarjrWd5Z1LKa
	MUwOzy9CihC46kgMpive7QYx9+AaJ5ojC2wQFAkwCII+BYfIVTiH4bZ9zymvbdAzUQAtHh1SsCxjZ
	8B45QKVj0rnlNfx57UNUIlnXgVRQG36MLeRN2BQeVgk2h7PwYRI6IhWclZQcOZKz81Gl4J0dUPCY5
	RU21fuodLkVh6i/vqqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzxsB-009spv-S7; Wed, 22 Dec 2021 09:25:23 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzxry-009sml-Px; Wed, 22 Dec 2021 09:25:12 +0000
Received: by mail-yb1-xb30.google.com with SMTP id x32so4719855ybi.12;
 Wed, 22 Dec 2021 01:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ORFzZVxyg8GODhOMMpOtv41PQGhosh0WLqrwBnhKeiA=;
 b=B/w6kerf9SdFia8Nkcc1UOpPuDDLMMpGU7/H1Zw29gLopNQpOryflYK+tiJcSBCrOL
 eXMSOgY26N32jKfX5yhm9UpKU9xgEFXZYCRq/cDMiCNaNTsYFjNVE1x0Ju0ESlHhJync
 3Qwz3Zm/3Nuk1Lq6QI8FtgiPjNOf8yzcP/MBVwTmC8wAm/5w0umIDjqcxmEdOkl1KnwR
 cII3MLjgT6VeqR33bJ0mwer+liZYP+D3zIOXxZ987tyY1uIT3teBdUjnBeeV7oi5qEKK
 nzqNOuzXMvA8TlrY7o6bpOVDmRmsOSMS0zja3YVu/FXSkHsQAqpoKmP+DQau4j3LHBUt
 qRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ORFzZVxyg8GODhOMMpOtv41PQGhosh0WLqrwBnhKeiA=;
 b=UMM6DrjUe+panpv0wu5xK8iGDdbdOXPGfDYjIHJE62mGrtvNevX6r5Fr0PduyeiUXG
 vJCf6kxT9/MAc/f/cRp5TFmFeuFH86Z4OQ+xNfUAL1ElhYKinKFK+N1kBZ0uquXLsXoP
 cTj1FeJrj6czlf4X6EXCfD72M0aysA1Ec776e8DtoNb5jb4J9mJLOAM7KncdIBaH4ELB
 l3fM58zAD0RnyULqnr4592eRVN3P7qg9xSkwATWaHnPStS6qejszCyRFInf2ce8WEMy5
 2kCZFRvs2D4AXe+ph2jthK80S917VkZN+8dLYmjUEZFIWwbRU6Pd58qW41c0zCAj2SIs
 XMLA==
X-Gm-Message-State: AOAM531s6pnWLxTKC1Au1OuWs6OQu4ypf+4vJ6qwq5FjkqVB0Zn04xhK
 Icm2YxrouL+/vcpvDs8g1Zu5qsjU4tF/mhdusx8=
X-Google-Smtp-Source: ABdhPJwU8VYZhu6V4H32fbpVDj0GoSIrK34Jtep5OL3Oo4KIzR0nr6pxIbOFV+2hHTfdN0xyrbMJZQNmbt9GqIcTMB0=
X-Received: by 2002:a25:a183:: with SMTP id a3mr3226180ybi.723.1640165109259; 
 Wed, 22 Dec 2021 01:25:09 -0800 (PST)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 22 Dec 2021 10:24:58 +0100
Message-ID: <CAKXUXMx0kMruMNfAv-Os1VSrgfg2vyKv17uDVq-QqB1Szwu+1w@mail.gmail.com>
Subject: Config REGULATOR_MTK_DVFSR depends on the non-existing config
 MTK_DVFSRC
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_012510_884388_F4E5C6AA 
X-CRM114-Status: UNSURE (   8.87  )
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

Dear Henry,

In commit a0db6b0aa670 ("regulator: Regulator driver for the Mediatek
DVFSRC"), you have added the MediaTek DVFSRC regulator driver with the
config REGULATOR_MTK_DVFSR, which depends on the non-existing config
MTK_DVFSRC.

However, the config MTK_DVFSRC was never introduced in the kernel
repository so far. This makes this whole driver effectively dead code
in the repository.

Do you intend to add a further config MTK_DVFSRC for this driver to be
compiled or can we simply drop this dead driver code?

Best regards,

Lukas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
