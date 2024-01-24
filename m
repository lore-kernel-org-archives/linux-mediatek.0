Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32A1C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 11:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ttg4cuwPleor3373hq9MQ8ovJJVXFgo++UNO3+/Of6A=; b=NsJHWzIRw0bgPhYmzYLVH4TFfw
	NyGLi8aMSUnCBeOyxVWychbcmbAR+b9G/0Jrp13C4KFVINE3zfVO2tryU8+Sm7BNb0ZkELeXmn+Sd
	otvXdEBbz76E8UrHB+h2lLmmaJcXOhywYYfNPDSym2Fy33w2EZ+Nwcx/T8Q+1Z43Y7BGG2nknfL2x
	N94d/fYnALc97XMKf067Xi1ecL3661L0KpUmC+vL3WxmHrmnqeu0V2k/fpit22dykf08p4PzjZjPs
	RD0f44kt5nhrOM1hWqf1aQ8Z0uYQec/0mcjpAejmT7MKZK38pGpGe4iBHypPlcZYKpBtNWl0tOGPf
	skFV0zfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSbaW-002ovd-2g;
	Wed, 24 Jan 2024 11:38:36 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSbaU-002ouN-07;
	Wed, 24 Jan 2024 11:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706096313; x=1737632313;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4KDkITjThVdXmK+bUfn3eDscOtSdUbZiuDnwLDTI5eE=;
  b=Z5fZQnAzWketCuAZfYBBqmBKmDwO2T6cxkOA78eKiE+vUvVzUiewZO5i
   KHZrd51dqv7bNgnkdGH27VYUKVMQQ3l7jtBphJ356WfWfArc+PNwNxo5b
   w6sBvoxNGTG2X2XCgjzG7DwY/KBn/z48xTx03l23O6M+mUV0NgY2CRM0f
   hDdC1wsbDItGs2LH2k95XQs68rVbjgVwur/PzZVk7n6nuUTSj+hkqCHzL
   nqufUlFiBYbow+gCZGx8YVYmZo4lpD2NX90Tms1mtbQHmcbTYj0Xgwil/
   ZvRAFCLTjcOIKlJ4cuc1/4ieHUzQdNh1jESpvX11+hUdW3zmuXVh5oKtr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1691938"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1691938"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 03:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820437647"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="820437647"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 03:38:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 13:38:18 +0200 (EET)
To: Francesco Dolcini <francesco@dolcini.it>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, 
    linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, 
    linux-iio@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
    chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
    linux-serial <linux-serial@vger.kernel.org>, linux-sound@vger.kernel.org, 
    Francesco Dolcini <francesco.dolcini@toradex.com>, 
    Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
    Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
    Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, 
    Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
    Eric Dumazet <edumazet@google.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
    Hans de Goede <hdegoede@redhat.com>, Benson Leung <bleung@chromium.org>, 
    Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2] treewide, serdev: change receive_buf() return type
 to size_t
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
Message-ID: <7d4309e5-fdcd-13d7-2d4a-7139779e3fdd@linux.intel.com>
References: <20240122180551.34429-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-695447939-1706096298=:1372"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_033834_174128_B41756DE 
X-CRM114-Status: GOOD (  15.13  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-695447939-1706096298=:1372
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 22 Jan 2024, Francesco Dolcini wrote:

> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">=3D 0" from serdev_controller_receive_buf(), change its return type fro=
m
> ssize_t to size_t.
>=20
> The need for this clean-up was noticed while fixing a warning, see
> commit 94d053942544 ("Bluetooth: btnxpuart: fix recv_buf() return value")=
=2E
> Changing the callback prototype to return an unsigned seems the best way
> to document the API and ensure that is properly used.
>=20
> GNSS drivers implementation of serdev receive_buf() callback return
> directly the return value of gnss_insert_raw(). gnss_insert_raw()
> returns a signed int, however this is not an issue since the value
> returned is always positive, because of the kfifo_in() implementation.
> gnss_insert_raw() could be changed to return also an unsigned, however
> this is not implemented here as request by the GNSS maintainer Johan
> Hovold.
>=20
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@ke=
rnel.org/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-695447939-1706096298=:1372--

