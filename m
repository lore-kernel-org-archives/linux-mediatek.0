Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAF1C48BC3
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 22:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Si25AaPYYhYTOkmgXRWHuRBAH3Xq06xq/4sUPyQ+50s=; b=GvZM99iioKyaYcjdYpklerKPPA
	P3gp5KMVXFQLw0ErRJdrJtk7pbIB2iChsrO1dEto0DjvfihU6PBjgirVlw6URrpOTli6oqursQY7q
	Rq1JNKsmq+uMSV6iYY6FL/W3D3QxAaUeud4TMzkf5FCo3btOjTAIJooa0562vdrpZx3Ydmu7vBsSa
	R6QBUTeLrhLb3htOnxIh6WPc02JzGGubVdDTBXvXXjcssXl7M1TBd26WsSi463e0LjEctOnaLCYW4
	arnBqoujOnkYessSHXEG7TVmrOF/XpGPQ/Hpl19Tc/eAqrhjGOfH6Fo+jCnrpTVMUQGPDfKXUNfhB
	Y5cLUR3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbTJn-00000006XcR-324B;
	Sat, 17 Feb 2024 22:37:59 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbTJj-00000006Xam-12OE
	for linux-mediatek@lists.infradead.org;
	Sat, 17 Feb 2024 22:37:57 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so3010597276.0
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Feb 2024 14:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1708209471; x=1708814271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Si25AaPYYhYTOkmgXRWHuRBAH3Xq06xq/4sUPyQ+50s=;
        b=J6HTW+/JmcLFLuJmyRBL9r5bGAE/MIm7KYSLphuW1K954jnoJ3JR5fhzDlkP+hIycV
         fF1suAPID85QehYK74xOdsWw58I0QMsJLTPnNTO3dM0q9OBD3irwcBXP5Pq+jxPpkMI/
         afIKgVbwbOvD4fptTmKm6nu6zGxxqUc+xgSpJBRzmzvS6ZwnPguNragaJa59uCFejQ+I
         uiLR5yr+TYtGDdrk5qNx0cihf8WBpDLQ2b9ZSeI9uT+QGslMW2gYyvyrSSGxujyw8ziQ
         N0tZcL+OvGMm4fKb9+U4jrBz592bq2iRkgICTm9zobnAlm3dY4ci4A6d9Xmvyp6W3jKW
         jCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708209471; x=1708814271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Si25AaPYYhYTOkmgXRWHuRBAH3Xq06xq/4sUPyQ+50s=;
        b=BbjHqxynyryRdmHx1b7ykbUpRiUumcqpOAeGF6D2nww1HfT4uq7U30ux7TiwilaXD1
         sLvDkB7B4wRxG50dUrtsbrLdzBcTSosS/pHq+CY4/WqNnRbfdOI+lq4bYBXPgpV0l8S7
         jUpRSP0XoZNmwu0s1/dXxZaE/t58ru3QcLUd7eHfpfK5TlRiHadJmXAXpcpm8rExBhrD
         BAMMzQav1vOIZyTEO4PisFrQDv8OCh6iUdle2qooqpeLLW7qG81h++E0P/CItXfr+U0K
         AuaZkITPeM/nzo8LOhBGJQOxyvJmHOQ89VqgkXN0IyLDuG11NoVCfCv0hVQCSWU+C4UO
         Cu4w==
X-Forwarded-Encrypted: i=1; AJvYcCVcWZPiWkRgWy9rv7R7leIqUDXuX8AdpXVV7qP3YFtJv0tzjP2P3QFC4YYZ8EJLchu//vWrPkQ459QYlbzQzmBw5OrBbmEVpEtiJ4ZFjnHMChhp
X-Gm-Message-State: AOJu0YyqkfWSTnLR1A8kXwpRwB76iRkykkxURvPWqoO2PNjz4z7FoZji
	i0klTedEYFxSGdr/E2up30umS1QIv+anC02Z7dxuhEWyDczlpip2R0LcR605sseewfGwOmhzR1a
	sNp5xOJ73pch7xSb9Gha64YINvZYHcXL1TZTp/Q==
X-Google-Smtp-Source: AGHT+IETMFjsYK3d6///nf/q6zU3UY5udQD41mjum77p14dyrbBbJatI8RG3wLWwYuGYzjxvZjlhJjf+lR1NXXadsAE=
X-Received: by 2002:a25:a027:0:b0:dcd:2f2d:7a05 with SMTP id
 x36-20020a25a027000000b00dcd2f2d7a05mr8428908ybh.35.1708209470967; Sat, 17
 Feb 2024 14:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20240217194116.8565-1-ansuelsmth@gmail.com>
In-Reply-To: <20240217194116.8565-1-ansuelsmth@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 17 Feb 2024 17:37:39 -0500
Message-ID: <CALNs47szQu9RB8stBkdn+q3ejKrQgUFCDzhS8Wzy+WENeL=xAw@mail.gmail.com>
Subject: Re: [net-next RFC PATCH 0/3] net: phy: detach PHY driver OPs from
 phy_driver struct
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Richard Cochran <richardcochran@gmail.com>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Arun Ramadoss <arun.ramadoss@microchip.com>, UNGLinuxDriver@microchip.com, 
	Peter Geis <pgwipeout@gmail.com>, Frank <Frank.Sae@motor-comm.com>, 
	Xu Liang <lxu@maxlinear.com>, Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
	Andrei Botila <andrei.botila@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Michal Simek <michal.simek@amd.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Robert Marko <robimarko@gmail.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Harini Katakam <harini.katakam@amd.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_143755_296572_C5B6B892 
X-CRM114-Status: GOOD (  12.56  )
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

On Sat, Feb 17, 2024 at 2:41=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> I took care to compile-test all the PHY, only exception is the unique
> RUST driver, where I still have to learn that funny language and
> I didn't had time to update it, so that is the only driver that
> I think require some fixup.

This will only need an update in the abstraction at
rust/kernel/net/phy.rs, roughly (untested)

@@ -5,15 +5,22 @@ pub const fn create_phy_driver<T: Driver>() -> DriverV
         flags: T::FLAGS,
         phy_id: T::PHY_DEVICE_ID.id,
         phy_id_mask: T::PHY_DEVICE_ID.mask_as_int(),
-        soft_reset: if T::HAS_SOFT_RESET {
-            Some(Adapter::<T>::soft_reset_callback)
-        } else {
-            None
+        phy_driver_ops: &bindings::phy_driver_ops {
+            soft_reset: if T::HAS_SOFT_RESET {
+                Some(Adapter::<T>::soft_reset_callback)
+            } else {
+                None
+            },
+            get_features: if T::HAS_GET_FEATURES {
+                Some(Adapter::<T>::get_features_callback)
+            } else {
+                None
+            },
+            // ... Other fields now in phy_driver_ops
+
+            // SAFETY: The rest is zeroed out to finalize `struct
phy_driver_ops`,
+            // which expects null function pointers for unused fields
+            ..unsafe {
core::mem::MaybeUninit::<bindings::phy_driver_ops>::zeroed().assume_init()
}
         },
-        get_features: if T::HAS_GET_FEATURES {
-            Some(Adapter::<T>::get_features_callback)
-        } else {
-            None
-        },
     }))
 }

We can send a patch if needed once this series moves out of RFC.

- Trevor

