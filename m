Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A103AC3F2D2
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 22:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B1C207FD
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 22:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlaBxOgK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EW642PHI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B1C207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trTgSpTAyQeZIxt72kbIVeuk+X9zj40VHxhFHR7gI5U=; b=FlaBxOgKSnsXqu
	2CyZpGaJuKdXmnLRhY5iH5PdVVu27PPWt34bUeDiapMb1S+tBATLkY7HJcedINfcBxgtzDNNagcRw
	ng+4Muun8V6NIBYWpTLh0rYLRCaTydPiSFIqxNB0uXKWxVbTgvqwrRHoH+/4mfwp4DUshVHAtT96L
	VcpLUF8Z/r9RjjOnIUlPT5Y6R00+TmeonAG3Q8Xu3GX06jGj6sDivWFCbxfN5Lk3mVePPI3FeoqEE
	NtAATDQ0eKIhYDITDjZ4oyDjjcwwENu50Mc4UDxZZrCXyxppP0zQ48LqG9VJyHcCc1UMdeeAvnz4P
	SZKFM+rzW/1Ap5zdt2Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9yhH-0004uj-Eh; Thu, 05 Mar 2020 22:10:27 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9yhB-0004m1-Hg
 for linux-mediatek@lists.infradead.org; Thu, 05 Mar 2020 22:10:23 +0000
Received: by mail-pl1-x641.google.com with SMTP id t14so3223397plr.8
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2020 14:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wP8ZLcoVfjRLy2wd1F6p7whOnIttnSe9o981shhqduQ=;
 b=EW642PHINIK0QQBXUVu9+0zYb98h6yXBQ6W1ECVmuPNBpv+xTNekh/mPEorDGkXbrP
 8R/GZTy5gtZKaGotUgRHMrfabg8VJ1UKudix3XnEE4X0wo4xpwsNgzn259YyN7kdpphX
 +NkbZc+7O2mRuEKZocKBF4+CZJu68vbYYfirA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wP8ZLcoVfjRLy2wd1F6p7whOnIttnSe9o981shhqduQ=;
 b=RO9gSx6eTLV5IXuIMGzIVQcIjlzzBkQbkvMf4BENujvKl5GAilfu3M1AHHqZbzdPkd
 f0nAGWtPi+6oNVkcsuStoN7mUomTJMOaCozx5bMt9QSzCRaLLOsXjpIEThYTQvK8snB8
 kbEWS/6EBt5pIlMPiJcS4woiIPZNb4OGtjW+MgwX7NMm9gFE/2Z19mW7j0BbvNkMcmiA
 Ee8KrilhVRf4cg82ygq9BlkO6NYOQmzjYpcIFpWWk09582TODEa0ngMkEizEIn59rEfr
 nBM6/FGjKSMlXGgSqzgQsNPZuRHVjfCT7QloCFh98zxphirlM3dRhKtZhNZ2KvjkvO2z
 u/+w==
X-Gm-Message-State: ANhLgQ3ZAh1PKPAfHVNc7e4U19Xs7graIztS2cfPH23TiKrS98gqQgvt
 u7lJ9+Ns+ZxANJ9fWru1MzUnww==
X-Google-Smtp-Source: ADFU+vsGiwCvQZPWkXv7TRZ4jmXWr6psRLovg1wV5hcbdmqIqfAlL8UTuWw6Uuwi0lyBRg1ClCAohw==
X-Received: by 2002:a17:90a:9416:: with SMTP id r22mr293883pjo.2.1583446217711; 
 Thu, 05 Mar 2020 14:10:17 -0800 (PST)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
 by smtp.gmail.com with ESMTPSA id q9sm32286268pgs.89.2020.03.05.14.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 14:10:17 -0800 (PST)
Date: Thu, 5 Mar 2020 14:10:16 -0800
From: Prashant Malani <pmalani@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: Convert usb-connector to YAML format.
Message-ID: <20200305221016.GE142502@google.com>
References: <20200305030135.210675-1-pmalani@chromium.org>
 <CAL_JsqJcJf0JZVHEuY5y0eHLyw3e0Wr2ZDJvPs4=cZaSMWg97A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJcJf0JZVHEuY5y0eHLyw3e0Wr2ZDJvPs4=cZaSMWg97A@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_141021_584820_72190D5E 
X-CRM114-Status: GOOD (  22.32  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob, Kindly see inline. Thanks as always.


On Thu, Mar 05, 2020 at 03:29:00PM -0600, Rob Herring wrote:
> On Wed, Mar 4, 2020 at 9:01 PM Prashant Malani <pmalani@chromium.org> wrote:
> >
> > Convert the usb-connector.txt bindings file to YAML format. This allows
> > it to be used in dt_bindings_check verification. This patch was
> > born out of a patch series for the addition of a Type C connector
> > class port driver[1].
> >
> > An attempt has been made to maintain the same documentation text and
> > example structure as was in the .txt file, but wherever needed
> > modifications have been made to satisfy dt_bindings_check.
> >
> > Also, update all references to usb-connector.txt to now use
> > usb-connector.yaml.
> >
> > [1]: https://lkml.org/lkml/2020/2/19/1232
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Added type references for some properties.
> > - Removed pinctrl properties.
> > - Updated power-role, try-power-role and data-role properties to be in
> >   valid schema format.
> > - Added OF graph data bus binding property according to reviewer
> >   suggestions.
> >
> >  .../connector/samsung,usb-connector-11pin.txt |   2 +-
> >  .../bindings/connector/usb-connector.txt      | 135 ------------
> >  .../bindings/connector/usb-connector.yaml     | 203 ++++++++++++++++++
> >  .../devicetree/bindings/usb/fcs,fusb302.txt   |   2 +-
> >  .../devicetree/bindings/usb/generic.txt       |   2 +-
> >  .../devicetree/bindings/usb/mediatek,mtu3.txt |   2 +-
> >  .../devicetree/bindings/usb/mediatek,musb.txt |   2 +-
> >  .../bindings/usb/richtek,rt1711h.txt          |   2 +-
> >  .../devicetree/bindings/usb/ti,hd3ss3220.txt  |   2 +-
> >  .../devicetree/bindings/usb/typec-tcpci.txt   |   2 +-
> >  .../devicetree/bindings/usb/usb-conn-gpio.txt |   4 +-
> >  11 files changed, 213 insertions(+), 145 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt
> >  create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.yaml
> 
> 
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > new file mode 100644
> > index 0000000000000..b386e2880405c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -0,0 +1,203 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/connector/usb-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: USB Connector
> > +
> > +maintainers:
> > +  - linux-usb@vger.kernel.org
> 
> Person please. You can put me if no one else.
> 

I will list you as the maintainer.
> > +description:
> > +  A USB connector node represents a physical USB connector. It should be a child
> > +  of a USB interface controller.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - usb-a-connector
> > +      - usb-b-connector
> > +      - usb-c-connector
> > +
> > +  label:
> > +    description: Symbolic name for the connector.
> > +
> > +  type:
> > +    description: Size of the connector, should be specified in case of USB-A,
> > +      USB-B non-fullsize connectors.
> > +    $ref: /schemas/types.yaml#definitions/string
> 
> Needs to be under an 'allOf' or the enum is ignored.

Done.
> 
> Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
