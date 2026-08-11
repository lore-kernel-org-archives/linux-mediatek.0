Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4D2C5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 06:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzLdaUEIX1BvfXPoEs7iJurYd6+YSJTfmxmB3crYs0c=; b=Pa3bumuMZKbqXof1zcBSEqtmzg
	1p90R3/bgeX4Bzg/cku80j0ikmZBtS4m/m4HLJha8JIT5sMYWw/fhhaoAw2aVFf0399qZKWvv8van
	TH9MhWNWBcgwPRVvhNrPhuNOeDVdetOb65f4upfuXv+KKtGtRWkrkTNIblbjsnz0pECQituyNytxi
	J0Hn7RQZUFdPIY7EMofbHAER+vCMVpbUrhoh+QXX2GoSbysy5Rj/b97l3yhDRy9snYSYqeHF8sQQ/
	ilZaS+EOyogHaXBfnfZMSBHkeHxta+JyOKwB0E72i4Ssl4mUEogsXUQY7m7kaiu/81YLXhn9HfBGc
	xInrSBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfoM-0000000DP87-1PsI;
	Tue, 11 Aug 2026 06:18:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfoK-0000000DP7y-30ET
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 06:18:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 119FB43D69
	for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 06:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB6F1F00ADB
	for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 06:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786429084;
	bh=BzLdaUEIX1BvfXPoEs7iJurYd6+YSJTfmxmB3crYs0c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FBOcDBMZ1Uw1fqJRo8015fKH6xO+wyL161DG5zJ5ra6cUgNDz20Zb02aSHfjpktOf
	 FldTdzP+FckaDhsqXc9GvmVj3PeSPuKrM1gyMz8Sip1UJdrIxOR7vIOAGwwha1QlbC
	 nWcLqgWrB1Se0Ag+kVHq29Q7N21roI2IGXZnD8oqFeIicfa1asvDo5YUpqRf/g0zFT
	 Qf6rvxXMMpDA+MFpzkL4CQHimkylqs5G3wS+voItK1kXAOP1ub1TXLJXpCzaW8K8g3
	 +Zan82mPHYNO9xMJsnfJ9C2VEZ2i7uSQP5j7xbrkDVkTVVFx4ublUeFNIckQprgMHS
	 0iHvKPbZ/f1KQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so2899397e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 23:18:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpOoiv5+730ktHeRBgSFbpcQCRkdgKvaGCJL9o9t/8HQ2RpBo9IKtum0HjPkUkVc+Ya6YMt+vHdu+x+aSDzIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5n0AdhaQXuOjgILMdTaMLpijJV5yKWS1P3s0OuADkf1ba+k3t
	j/9v6e0lFjMHlHryY/rJZ3+WrToTq/QeAfluprgp+VbduaCOEWM/KMcxSdDEB4eWQhaJ1VOD0nZ
	otuR8Ww92HtRK2lPEaofZvygtSsAb5x4=
X-Received: by 2002:a05:6512:3c84:b0:5b2:aaa2:1d97 with SMTP id
 2adb3069b0e04-5b448654039mr150789e87.48.1786429082679; Mon, 10 Aug 2026
 23:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786262697.git.naseefkm@gmail.com> <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
 <CA+_ehUwO0WEiDGE18a=v=ZjJhpZB_KVP=m-Cog7K9Cm-zZV6EQ@mail.gmail.com>
In-Reply-To: <CA+_ehUwO0WEiDGE18a=v=ZjJhpZB_KVP=m-Cog7K9Cm-zZV6EQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 08:17:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8BvLvzwN5a8+dZDXU7sSM5m18G=XEnYtWo5ziJ=N6nw@mail.gmail.com>
X-Gm-Features: AUfX_mze3ESUSsSYW8CEZRJNkHQmDt4gP_VSFyh2kb488Z--smL2Lv1F6RAXAFo
Message-ID: <CAD++jL=8BvLvzwN5a8+dZDXU7sSM5m18G=XEnYtWo5ziJ=N6nw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 10, 2026 at 9:27=E2=80=AFAM Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> wrote:
> Il giorno lun 10 ago 2026 alle ore 09:23 Linus Walleij
> <linusw@kernel.org> ha scritto:

> > If we can get a speedy review on these patches I don't mind merging
> > them for v7.3 already, it's nice to get some movement on all the
> > nice Airoha silicon.
>
> I wonder if the same speed treatment can be done also for the clock drive=
r and
> also dts?
> There are a few patch there that are currently blocking usb phy and pcie.=
..

Heh not my department. I think the SoC maintainers can merge some
late DTS patches, the clock driver is up to the clock maintainers.

Yours,
Linus Walleij

