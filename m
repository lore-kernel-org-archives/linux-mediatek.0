Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405C5C79F80
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=; b=PfxRXasQkKfTup+ObHjvRr5Iac
	lLKfh+RvtFU6SOcOdJSCuvAEJInwu5yDzZcCJGH7CYqLYn04Thrz+5UBbuIv27vD/JwgOQk/ngS4Y
	VBkJIiXQog8/NfTQ3Fvs2f6tJo8JiMglTtdQbZzImrMdYmtecB7Vw04bCFoNin6YtmeX85dO6M0Aw
	hHjwPXzoxiY3+1ZvQI4ADI+DHaqWawdCdjwjB4fuk+libs036UGELTOzQVIF0QwuElrvHBMioIbDo
	/m2mJPxDMLkTdj/Ve9K0dAk/y1znU1txUP3V6FKTfpmfH6yGJ5JJOm1WTqqY5edZevPxVV9C4ozXo
	ztTSeZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X1g-00000002lYy-0O7V;
	Fri, 04 Sep 2026 16:44:28 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X1c-00000002lXx-1nRX
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 16:44:26 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-90cdffe8e3eso13575186d6.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540263; x=1789145063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=b7dAybaXKgKyN5btegm/dY1wPQ8dEEUL5MVQmCk/6hNSuMD9FWNNVY/lkbrmcOFwpz
         lZheptkqa0xbCi0f2C7os/P5uaylVa3WLsfmhDKemCIRz9XE7GnN+kwkM2MapipR2q30
         JxraZxEJRh57l11SpdF57J1AYR58Nyzn0O48srhzX3cQtfC+wbJ7GUdBRH7h3HV0mWA5
         hC3J4ly9moYuJO+A0i4ywBADtt/Ew2fHm9PdpkTFdBFHKiHk9arPfxhUxAvXNM5MSMK8
         Qe9d5ZqYhSPNCwXZN6o4YjhDoywatjs0lmWeGgDS1RVqLs4/XYedZTGB3nXK5Hzx+1yE
         kh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540263; x=1789145063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=kna2O1JDNbn6cCebPJuQzXqF5s9Ym7UqHs9CU+xsoPoAVmX9ni6WzWva8I+jSiJqKZ
         iC6nqtenC4NTa7bPzTa644k5+6qwJf3vnBcumIOPoSyVWj8g60+2uB8Nq5fyC9a+tFYe
         Ko15NXo/hXgK7yxSkfxLndc8bLA2oUMuAKqkF5a30tM/Gze5785Ctjip4UbPJOktrCNk
         Bky0/8xTIkd3o+ociCrzpEHSSKIsY/q+C4kkOupTI6iBIJJGPgSFRbkLlDGaqeP16hYf
         IgmpmNekdpqYCEcg6spTPZ6U2GiONeCVxLiQ3fVKH7N0EU4bcTavNuNlx0H/qAesNnkn
         VOtw==
X-Forwarded-Encrypted: i=1; AKwUvByGR1lpfsC1BSZuSnCV9YTjLiF4PscstUShnjPerydopf+Y06df7vWddZkCWHctbp6KT5AmiSTWtnDni6Sjsg==@lists.infradead.org
X-Gm-Message-State: AFuF++nyK4RBZB/OnsaOuQTOhQ2/RncIPTlBvA93zC8eYPuq9VVKia9d
	dN+fp7GDaZOhjbE81bFWBmR5P5wjRIke1Q0Ee493RaDMPfS/ae0xgemx/FYvAI5IqQ==
X-Gm-Gg: AYBFou1FyLLtsWa2h6z+TawtUFz+J4Ii07h+VNRz1N6Q63+/HJZaj5TGxn2UVPTGg2A
	gftwggTj/6Wz54tJYPoAuLtCPw9xuW1FEFNN99lbarOiRQnSy7roZudKlaT+/vWx09FC6VmQqCl
	eqb0bIXw7AZchgkXv+QuT9HBXXTKDnhzKpHOOqkz0/FqefPTlRKTGgoyTlRXZS0lHqw98qAuhSt
	T+Wy4SFJVsmY2ENsqxoIKldPHgTQ345jQ+96BY01NnXIeZrpXcxDwzLHk4h96Y3zwkBNSlTU04f
	/F6GAOAyQw8f4xSfY/nFZdtZfHxAcmEOOwcWFvWZuCYcaf4C3Zl0IET/PsUPmsr9K2QEP41o7oJ
	h6i1+T0O9t+fKfSVuBL+/I8EFaTmx8ZHToHoLZ9E7PisdBIsZdczTVCaFkRyB5hCt8ZIQGyHFfF
	mVHeQQA2I2GuECAd4jY8/veZi+EpItaSj7j3uORAwUboPqRv1QXxc8e2gVQgKFCQ==
X-Received: by 2002:a05:6214:3003:b0:910:3d6e:ed46 with SMTP id 6a1803df08f44-9103f0db656mr78478096d6.31.1788540263010;
        Fri, 04 Sep 2026 09:44:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040646d64sm24672736d6.14.2026.09.04.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:44:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:44:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 08/16] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <c3740c4f-6ae8-4c6e-8f80-105f1607ef55@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-9-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_094424_470287_C2A549C8 
X-CRM114-Status: GOOD (  13.13  )
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

On Fri, Sep 04, 2026 at 04:41:47PM +0800, Chen-Yu Tsai wrote:
> usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> it to tell if the hub/port is SuperSpeed or not.
> 
> In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> state tracking field in |struct usb_port|. Either structure can be used
> to identify whether a port/hub is SuperSpeed or not, as the field in
> |struct usb_port| is inherited from the hub:
> 
>     port->is_superspeed = hub_is_superspeed(hub)
> 
> Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> |struct usb_port*| so a subsequent change can use it.

Minor complaint (not referring to anything you're doing here): 
port->is_superspeed really should have a better name, more like

	port->is_superspeed_capable

or

	port->is_usb3.

As it stands, the name is ambiguous.  It might refer to the speed of 
devices that the port could connect to, or it might refer to the speed 
of the device the port is currently connected to.

Alan Stern

