Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B63DC55184
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 02:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=; b=pHw3h9Z/ct8br9GEMcnlcB2g3h
	XX7o8xXt3mycwuSCw5J3ZuQQnrgwUxjb1OnVLDZ7qHiLpLu1GwwDJJUwHQ6PiSYpagna3q5QEtmK/
	/HhU6raJiPTYVLVJ/+hiye/XajJAkfDuGa8MMlh55gqHaQZhT7xoIviTMhV/7HRk3CO7dg8v+ZgHB
	B2N4ck1jSOesLNBXHAKlJ6suvQTp+4Q/TiYpdsH8iZ+tPp2EiNzAaR46S23FJfP6OLib0YncnAGf3
	JXI4azwir7xUnM5s2p2xF6oPSccDraBG4nfiEe3fl7JZuCCcAF2IMHcSQKM9qDDjKPFy4GKXn3IzE
	1h/Q38RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5A4-00000000rXq-0XSN;
	Tue, 04 Aug 2026 02:45:48 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5A1-00000000rX8-1duZ
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 02:45:46 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-81e9f7491ffso61192417b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 19:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785811544; cv=none;
        d=google.com; s=arc-20260327;
        b=hXRfZ3ntV/CeO+j92HjP1WQqOJ6+8UIm5FtW+NtrvymN+TzjQjtv5GdNOqS205KrQb
         HMyMGleE6k3JrEdl6MfGQYvd58nE8jEOvlCHRs29BbqRhDpqb2DjkENM+sZQa0QYzcKo
         YDDJm9FtHRATYhO3PKr4odZe7mzCKiAswxot9q1dbm4shYMPy3LKIL6wKGuMc9lAnMWE
         5XQGTizODkrrJC8dMEh1760Yku+3jy6ncCerkWNFNO8/+AALLeUKzrs55/neSnjslZnr
         LHI+xE2drathFZ6EQ4PoWxSAIaNsW/juuO0FL+CiLRD19EkRSu5GHuLC48fUkoeCR7mN
         vA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
        fh=3oW5V5kQkIIlKLB1ZMRJUbtTIOieBIkWTDGeW8F5YP0=;
        b=XNI4YDOaeit9uN20CEvsocMR5j+DewiZnsYIPcvcUl8N4guTxuT/vixTUKSc6XK1Ng
         I2v6KDSdECX/oq/4o5ZQd4L6q+f26XQg/f3ktG8nyw+LyI3vhPkLkikMxDritWvckZPg
         RNJf0AGXi2qPl0BDVpfY9E5RHJ559Pm9BRvqbNsZi1Jr9xBqbo8bHUTzY0QNWnyEw6eJ
         rCWjsKzkBSzSDCxo91Gcdbdqo09Oh+wlpw+nrQx9SHZvr1gTp7F8nqMLoO58d9Jg4j1Z
         6LbdWsd6prhY410mUo5y7ejpA9JCfjzMvoyR30V8iKpI6lZDMMl1ZhiEzN1EDex44TfR
         qgeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785811544; x=1786416344; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
        b=c5jGwZJUO7jktYNXEpTput21lHWXAaE59WLcU0bawQzGp/hHXqyhJ+Ml3bJPCI06Zq
         r2SoIjbIqM7RPjrrXK4OBVyNlACZdiDlXQ6yg9iqSWA9a1L23LuvMKMXOgtrbmEBAdK6
         mmqVTcTSetZUe8zS2JJ6ZZF84fRBCpJC5OtX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811544; x=1786416344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
        b=RNtfrYXRvrTJqOC0GmEglkBArzunE9ZseNvfUPyykgrPw3HP/DjQIyuS8Vqy0JWDrO
         nLdHEzTmlxL0q/V4UWnuEd67EkNH3RIZQW9AksLfYlcy2md5ZO3m/5x20A0xfHva4KIO
         7iMeGqOpIBAQsZytaIMZmyl/65suRwEKlcUXP5g42VHF4dlhuC6Frlz+P/xA2mZugqqc
         VIWxPFXCmI78F7RIytuiOfvwOyvZtloWv+LKHaBkcG1se67AZD37izZKyJnPdMWIwEe4
         7Yut9ok30I5xBGhnqoN7b37auwNvSYp6MCaQMMC9tRt+kvqTP9m1/4TQz93WoIDJEuNs
         tyvw==
X-Forwarded-Encrypted: i=1; AHgh+RoD+7QURGvMOdByzb5tKXhDjgYCU460/9bAa7b39E/zmzlMj7gndxhuvNhQ99A+YsJnQGnqSzhGVYXE2bmNWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIGwRO+SurL/7A+aNkA6Biqhak3UPg+Q6w/xcnhaesAXfbpiMY
	V2xi7jD5jc01SQgPz9A50kSgRjKSxoGNiw5NCQO1MhZ+e07DgUj/LYP6F9tvDgxeth4IrgUFF/R
	7fOcHofADTGjxMcFg5VGtCBh2BQXzGwUVbfmuFxwp
X-Gm-Gg: AR+sD13Ybw2/gwrF+/ijengwengDjlkhpUxqGH5tTRxg3IxMbgPHPudnX3VGIxmjot/
	CzvaW2hmtHUT+YjzOx2Tmx6sCdxaMnV/0ngChq7w1DeRaPFyyizBi6kHA3k0Ij3sV7tTRY7lS3x
	6Y5qpr/0uUT+IO/cp2vnTKd3NalOzB6CdmI0TntSxTFh/tgIWA9eoaD0TWgm/ZbdqTqz2YrQ22r
	hy1B8sOGaJLmUWeHEDkbBHr6Uh5bbZZkJg4mMpoP2apluMwuQ5fftAQ3ZIwZrZGHgnrw8C2DBJG
	13d1pSd8Bv5bIKj5praSNMCGN1gGPbBjEV7g646mJ47yDT0=
X-Received: by 2002:a05:690c:6d07:b0:81f:27f8:2de4 with SMTP id
 00721157ae682-81fd4a04799mr160372987b3.8.1785811544182; Mon, 03 Aug 2026
 19:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260803141659.559129-1-akkun11.open@gmail.com> <20260803141659.559129-14-akkun11.open@gmail.com>
In-Reply-To: <20260803141659.559129-14-akkun11.open@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Aug 2026 10:45:33 +0800
X-Gm-Features: AUfX_mwLcNdgKSX0dY1YbYf9cwLK9DsvJWUXl-Ukek71RJiEJ4s-l_75YEo7Ku0
Message-ID: <CAGXv+5HRsFFhzSYPdk-zmipLTVwxPkHLbuFP=wn_f_D+3ejAMQ@mail.gmail.com>
Subject: Re: [PATCH 13/32] clk: mediatek: mt2701: Switch to common
 probe/remove helpers
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Haotian Zhang <vulab@iscas.ac.cn>, Kees Cook <kees@kernel.org>, 
	Miles Chen <miles.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Sam Shih <sam.shih@mediatek.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194545_434793_EAE75AE2 
X-CRM114-Status: GOOD (  10.78  )
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

On Mon, Aug 3, 2026 at 10:18=E2=80=AFPM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> The MT2701 clock drivers can use the MediaTek clock framework
> common initialization sequence. Reduce boilerplate code by creating
> struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

For all the subsequent conversion patches, please try to mention _what_
led to the converted driver being able to use the common helpers, i.e.
what prevented it from being used before. Was it the PLL, or PLLFH, or
something else?

Details matter.


ChenYu

