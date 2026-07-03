Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4756DC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpEgYLnkdRe+6URxXdbXlH7fdAucEfU8965vZ1JNkpE=; b=PyGDvwn/UyUKMAkCVngH98+hbh
	Q5j/rCbI1qAf8+6/u71JdE/8ugpSM58fcIX5fOf4bPNZdBEaTR5MHq4qFghuTC+qycRpD1Sdecwzl
	Aur72rQyeRd3hI94Tfrrek1OfABwHjn8ued58Xxc7fg172bMokk4iICuTeGBGSgnpdd0xQVVAda+s
	NW/+gutgpn7TtaqkKTs8rMDBnfISnkl66OWcp8jxgQccWA0cRJfSS++xPA7efJ5Q9ccz7lj1DvF+L
	WRv9GK3RvIjPBKRwQ8OYFStk13EoY5+PZpqpNKZZTPeYY6wvZvYPGFg+wpmXKYKc8/X5pCiiIw3Uy
	0xQVIa+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdU8-000000071k4-3oa6;
	Fri, 03 Jul 2026 12:59:12 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdU6-000000071jG-0ruz
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 12:59:11 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-664ee752958so769368d50.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 05:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783083549; cv=none;
        d=google.com; s=arc-20260327;
        b=nJe1Uc/BCIRX68BBRVX4UCGwKdlXN+26JA3yGEQYjwW9eQrRqHZEanf2HU8Oq52o4M
         3L3Naw+7tASxffnGvGUXJKpadY3CGW0fBc+YrsEoZWtKhWaHeLkLkQw8u610sSzXCJzd
         +9joyIJgivwtwDj6DjmSpqhubyWvYQ2wY8PR2XgiE0BYvIJExll1+FhMd+Z3vEUNjcIY
         115fx/WJcLW5pvGUcOqSJpbmvscd3spe8nfFiLScxOyCSL8EFMoWVj1I3TDG2Q2Qkuu9
         EJ4Wy5B9/v8DIsJnEvMNaDVhCmiByRn79O3pDutljwdQxyUTGTV6Z3jktFdFGz8g6cn7
         yr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZpEgYLnkdRe+6URxXdbXlH7fdAucEfU8965vZ1JNkpE=;
        fh=SZ2gPXFlAOgsY1Krkfhoka6VkSuuq/LgEkuP4xEi9Sk=;
        b=XdeJiA6m9vS6jS5Kgb655ILk8DdjyaiWEWD5ao0QmzzTxjhdk7L/h45QRVv2tQJOZ0
         cfUIxa+wtf/dOvisgwONBfDIuw6QqJSb+tRgln7+cfhMYWfx/ZbeU2Y+lkEiTcYxGODz
         ISMZz52XGszaxJa93dstzNzQBlpehhKy6mBNzfdoLkBc7mmkmqvbrgwyfM+NbXktWpfE
         cz022SwO5ZYJpokIsoBAFUSuOsBPhi/DULBtBLZ+DLpeG7dz8RP0zS83cdXI7MZkE25M
         8WPFJ/m0QvkYKBE6c59T7KwVvDKw9tNzQypOSgwCs7txeZclAyBMHWtm4jMaUSlHeNHy
         qXdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783083549; x=1783688349; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpEgYLnkdRe+6URxXdbXlH7fdAucEfU8965vZ1JNkpE=;
        b=EyTTfjTc4TyG77O1zoLMoSBPc3Kwa15OsQuQ5CUfgnUFU9KHyGJB4CcRWc2Y0LBoxi
         8XNVGWy8ZwAAGwP33lfnXJU4mg7WikSNyvKartOkep/QCCutjyXUqJX5UzCG4OCllQ+s
         WdQWx2Nd3ZxSy0C1qCkVhLBM45Oo0XAgEOlCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783083549; x=1783688349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpEgYLnkdRe+6URxXdbXlH7fdAucEfU8965vZ1JNkpE=;
        b=GM8h//LW1s4397d0ohGL7H5rbMOJOZzVjPTVD0GR12jycAfQqPGn1Pkatt+223RPsT
         NLZAS5PlT9EGJfwFE+JJiMKm4Z1QB8JwHqA9bCoZh3oG/kFgIiJGjCY25rneOH6dtijB
         Esu8xmYZ83lKkDp1i8Yod4KM2o7RnkhXnMF/oBwAjdy4io4yVPUFXOwMETKgal4Reay2
         ZtQWorgah+JNZf/yy/aagcWxPj9pwUoCBX6rv0jlxtyapIlvZZQFC26Uu+SBRPiMJ2C/
         t9TPVjGxR9atnFK2KiU7fESRDbtk0AhapJIRC8mr3gS9EuSYnmxmqrsnzeVRQhu9fq8S
         4DLA==
X-Forwarded-Encrypted: i=1; AHgh+RqsuNGpWsvn0lrwTCBb2mzp37x+D2unHnkGQqnn73hqCCvImurdlmxIxypfyHbuTFJpgQIGq+g+8E30F720yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwH/bceA0XiwvIUIuqq95br1wRiNq7jR0AuEits6QOxMrpIL21b
	9ZHckw1LpZMu5dxKTQ3Ay4hTc1NMyZ7O7XxkKk41RODKK0hhq4ynE/Ffx1rKJavddOTDUgfu0nE
	q6dIjVeYz05vmr54rNjjIESUThEuq8xyEBfpOwAaf
X-Gm-Gg: AfdE7ck2Fm4lxMK4+dCeVNcrnq/+9BbsA0Y5KHmkw6f+x0R1qQHuLqNF4BPdHJRAtc+
	liAhkqTf6tqJXH5LvFOh/zyY605lcXf8QpuywAvOsi0mkFX+p0Sky8LLbJYFz5QESe3VsoxeetY
	hiZ3d8pe01fqxu4clIIfWZfR7LW8+knPOyfM75ctMiyxUe6jWmWNqutI883OdmFjzKiQNStLpr+
	sPN0JvgmsxHsEnfdKeJ2n4vn2No/5AtHYkiXl/BTcESXEZ8Qhxp56uN73+zKumnsObfh7QWAAGd
	KI6eUfPzaddSNr8nDEzlBuifM4M=
X-Received: by 2002:a05:690e:1908:b0:664:ef34:33 with SMTP id
 956f58d0204a3-66521d1c65emr9453570d50.74.1783083548882; Fri, 03 Jul 2026
 05:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-9-wenst@chromium.org>
 <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com>
In-Reply-To: <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 20:58:56 +0800
X-Gm-Features: AVVi8CeKAFgvldQwkCHupVnLS-0_fUDpMC-9BOMhYWR8u-1abjmchaeDfiY7p3M
Message-ID: <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_055910_306183_4F75152F 
X-CRM114-Status: GOOD (  54.54  )
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

On Fri, Jul 3, 2026 at 8:41=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 13:03:09 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > The new M.2 E-key connector can have a USB connection. For the USB devi=
ce
> > on this connector to work, its power must be enabled and the W_DISABLE2=
#
> > signal deasserted. The connector driver handles this and provides a
> > toggle over the power sequencing API.
> >
> > This feature currently only supports a directly connected (no mux in
> > between) M.2 E-key connector. Existing USB connector types are not
> > covered. The USB A connector was recently added to the onboard devices
> > driver. USB B connectors have historically been managed by the USB
> > gadget or dual-role device controller drivers. USB C connectors are
> > handled by TCPM drivers.
> >
> > The power sequencing API does not know whether a power sequence provide=
r
> > is not needed or not available yet, so we only request it for connector=
s
> > that we know need it, which at this time is just the E-key connector.
> >
> > On the USB side, the port firmware node (if present) is tied to the
> > usb_port device. This device is used to acquire the power sequencing
> > descriptor. This allows the provider to tell the different ports on one
> > hub apart.
> >
> > This feature is not implemented in the onboard USB devices driver. The
> > power sequencing API expects the consumer device to make the request,
> > but there is no device node to instantiate a platform device to tie
> > the driver to. The connector is not a child node of the USB host or
> > hub, and the graph connection is from a USB port to the connector.
> > And the connector itself already has a driver.
> >
> > Power sequencing is not directly enabled in the connector driver as
> > that would completely decouple the timing of it from the USB subsystem.
> > It would not be possible for the USB subsystem to toggle the power
> > for a power cycle or to disable the port.
> >
> > Also rewrite the existing set_bit() and clear_bit() branches with
> > assign_bit() to make it cleaner.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Expanded subject to mention power sequencing API
> > - Dropped commit message bit about power sequencing Kconfig symbol chan=
ge
> >   to bool
> > - Added optional dependency on POWER_SEQUENCING to USB
> > - Split out pwrseq_power_*() calls into separate helpers
> > - Rewrote set_bit() and clear_bit() branches with assign_bit()
> > - Dropped the pwrseq_power_off() before pwrseq_put(): pwrseq_put() does=
 it
> >   automatically.
> > - Removed pwrseq_power_on() from usb_hub_create_port_device(); it will
> >   get called through usb_hub_set_port_power() in hub_activate().
> > - Added checks for port->pwrseq in hub_is_port_power_switchable()
> >
> > - Use separate pwrseq descriptors for HighSpeed and SuperSpeed ports.
> >   This makes things simpler. On the other hand to power cycle a port
> >   userspace needs to toggle it on both the HS and SS ports together.
> > - Dropped pwrseq state tracking again
> >   The power sequencing consumer API already tracks the state internally=
;
> >   doing it again in |struct usb_port| is not necessary especially now
> >   that the descriptors aren't shared.
> >
> > It's unclear to me how actual hubs reconcile USB_PORT_FEAT_POWER settin=
gs
> > from the HS side and SS side. One hub chip vendor said that VBUS_EN for
> > a port is on if the flag is set on either side; however actually testin=
g
> > on one of their hubs showed that VBUS was cut as soon as the flag is
> > cleared on the HS port. Maybe it could be different if a SS device was
> > connected? That scenario was not tested. Testing on another retail
> > bought hub seemed to work exactly as described though: USB_PORT_FEAT_PO=
WER
> > needed to be clear on both HS and SS ports to turn off VBUS.
> >
> > Under this scheme, I'm not sure how the power cycle in hub_port_connect=
()
> > would work correctly.
> >
> > - Link to v2:
> >   https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromium.o=
rg/
> >
> > Changes since v1:
> > - Switch to fwnode instead of OF
> > - Tie port@ fwnode to usb_port device
> > - Move remote node compatible checking to separate helper
> > - Use usb_port device to request power sequencing descriptor
> > - Drop "index" parameter from pwrseq_get()
> > - Do not get pwrseq descriptor for SuperSpeed port; share one for one
> >   physical port
> > - Add pwrseq state tracking
> > - Link to v1:
> >   https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromium.o=
rg/
> > ---
> >  drivers/usb/Kconfig     |  1 +
> >  drivers/usb/core/hub.c  | 44 +++++++++++++++++++++++++++++-----
> >  drivers/usb/core/hub.h  | 10 +++++++-
> >  drivers/usb/core/port.c | 52 ++++++++++++++++++++++++++++++++++++++++-
> >  4 files changed, 99 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> > index abf8c6cdea9e..ef1959363fb1 100644
> > --- a/drivers/usb/Kconfig
> > +++ b/drivers/usb/Kconfig
> > @@ -44,6 +44,7 @@ config USB_ARCH_HAS_HCD
> >  config USB
> >       tristate "Support for Host-side USB"
> >       depends on USB_ARCH_HAS_HCD
> > +     depends on POWER_SEQUENCING if POWER_SEQUENCING
> >       select GENERIC_ALLOCATOR
> >       select USB_COMMON
> >       select NLS  # for UTF-8 strings
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 8ae97e8c26aa..dfa0f5dd75e8 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/random.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/kobject.h>
> >
> >  #include <linux/bitfield.h>
> > @@ -871,6 +872,30 @@ static void hub_tt_work(struct work_struct *work)
> >       spin_unlock_irqrestore(&hub->tt.lock, flags);
> >  }
> >
> > +static int usb_hub_set_port_pwrseq(struct usb_port *port, bool set)
> > +{
> > +     int ret =3D 0;
> > +
> > +     if (set)
> > +             ret =3D pwrseq_power_on(port->pwrseq);
> > +     else
> > +             ret =3D pwrseq_power_off(port->pwrseq);
> > +
> > +     return ret;
> > +}
> > +
> > +static int usb_hub_restore_port_pwrseq(struct usb_port *port, bool set=
)
> > +{
> > +     int ret =3D 0;
> > +
> > +     if (set)
> > +             ret =3D pwrseq_power_off(port->pwrseq);
> > +     else
> > +             ret =3D pwrseq_power_on(port->pwrseq);
> > +
> > +     return ret;
> > +}
> > +
> >  /**
> >   * usb_hub_set_port_power - control hub port's power state
> >   * @hdev: USB device belonging to the usb hub
> > @@ -886,20 +911,24 @@ static void hub_tt_work(struct work_struct *work)
> >  int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hu=
b,
> >                          int port1, bool set)
> >  {
> > +     struct usb_port *pwrseq_port =3D hub->ports[port1 - 1];
> >       int ret;
> >
> > +     ret =3D usb_hub_set_port_pwrseq(pwrseq_port, set);
> > +     if (ret)
> > +             return ret;
> > +

As Sashiko pointed out, the stub function returns -ENOSYS. I need to add
something to handle that case properly in the helper functions above.

    if (!IS_ENABLED(POWER_SEQUENCING))
        return 0;

seems to be more straightforward.

> >       if (set)
> >               ret =3D set_port_feature(hdev, port1, USB_PORT_FEAT_POWER=
);
> >       else
> >               ret =3D usb_clear_port_feature(hdev, port1, USB_PORT_FEAT=
_POWER);
> >
> > -     if (ret)
> > +     if (ret) {
> > +             usb_hub_restore_port_pwrseq(pwrseq_port, set);
> >               return ret;
> > +     }
> >
> > -     if (set)
> > -             set_bit(port1, hub->power_bits);
> > -     else
> > -             clear_bit(port1, hub->power_bits);
> > +     assign_bit(port1, hub->power_bits, set);
> >       return 0;
> >  }
> >
> > @@ -3249,7 +3278,10 @@ int usb_port_is_power_on(struct usb_port *port, =
unsigned int portstatus)
> >                       ret =3D 1;
> >       }
> >
> > -     return ret;
> > +     if (!port->pwrseq)
> > +             return ret;
> > +
> > +     return ret && pwrseq_power_is_on(port->pwrseq);
>
> So this is only needed to not have to track the state in a separate field=
?

Correct. Reading the field is not the problem. Updating it is, as the
fields are packed bitfields, and Sashiko suggested that locking would
be needed, though it may have been for the peer port, which has since
been removed.

[...]

> Looks good to me.
>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks
ChenYu

