Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEC6CD8CA8
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=; b=cm9MsnHOTa0BKtzkj2hidEOT/E
	6DNWMSbewOFENLkIFERqb/RMeQNC7QFN/NpyZEYEG4F/EBRbuQiZvzIjNgZSa32XfpEwGJTnE8ql4
	pmLnkTqmhPJ/GfuoDg6VdkCo3/ARg6L6yDb8AAZN8EU3TI/dAdKj472ZZDNzINi1CMfji22ibq/CG
	4u+nv8wb28uaaxm96Wi02mnF2NEdmzdKTtwvDvB6LGAiROr/+lkAQ1jQLOBq73DozoJgknp3pCGzf
	3lo5OYw6UJtIXSSaD2oFSE0zi9UWR9nzsVtuZEmYM65OrOcth9WN5B1KPNbI7NQb7vxYst0UmIV1C
	Tn/d4U4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXy1O-0000000AeeT-3vKm;
	Fri, 12 Jun 2026 09:17:50 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXy1M-0000000Aedk-2Vdp
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 09:17:49 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7f69b71f7b2so7685397b3.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 02:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255867; cv=none;
        d=google.com; s=arc-20240605;
        b=Uq4GLwgaC4gSuHg9bmrI8ctjbfUIzgOKV8gA57egl7o2vb/HkWeIDOoJ73wLedmkng
         eQQhYYkrw+HUryk+bG70ciM4bXftbvrC0OYD8yaVE31kh+JnzDOtni5oEK9P4+r3VhiY
         8t8Dcz+gMKCtqIWv9Q1mPtWMKgy5ETKAze6EMlvPitK1xMs1vdRQ74+U+fk3ZfKb7NSa
         OePY1TdH0jZixnolUw4TNVeox586F0mNBJ7a7N91i69Zfnt/Drzh35EVQ5v9IgfRNSI+
         7MWy+roqMsmDClAIyMJK4stdccZX6EeoDBnPVizREMVokVo4/v7p1v+H0x8FTWKZq5n6
         V7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        fh=K3XJJ29HDlCGrSE2Z5w2mYzkIA4DjJrXva0Pg+1p1SU=;
        b=H0hXY5KagjpnXiopb9ovZcf08AL+hgib89tKaYKlr6xxp4oMo6QodD0GiHvoBEGSoI
         8DAx+a1GslO5s1YVUNjUJWLhZ96uPZ8/sGlM1fMGVcxmHcMwJV+A4zNQVNf6hI8EFoAR
         x4QsQgMCiFICcGpE9binsJ64F/f+L4PHRSDi731zgi9xJ/eH0ZXpOPz+RKVYoOTtw4qf
         nQokqMrFnmYC2KHxiwFi1bELl9MBKtvy26fHtZv54Efuav7K/WtC+J6KYZuDv9jrISTA
         iJbfQGS1O7CJLLoVSAgtf4iEdcHu54ziTXkl4CeCtpshfAvh48fcn9ZRg+DwniS982tR
         UQ8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255867; x=1781860667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=PmP/oXhtHrSfkT0f57kptGX7kFCbeW7QARvQQY4m0q5+Zog3wsolwqqUp9egT6ojue
         dEYxiVjfsINQ1psyK1iKYiGLGy/JSDDCImFtFIGtFFCJ+lJG6WsiZMThRn9SvZH4OMZB
         a/KSNg06outJgRm16vmZUx7F0sapFrYnhaeuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255867; x=1781860667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=g8wmWsIxXHqxf5i9rLFvEYTlPyWCVvZ5rFMBSm9CVp+YKtvWD9Ihahl+fG8vKBsPpH
         u+HQrQhLQeIbXvhmmi2GdcNwji1e6r08BWyAEkW6xfCxBVCG2Orqs/VcXcZAI/zY7nTo
         qI7kG+ApvT0xR+155bdEmL5sMK2VOikd/fEVoc9SWvmN8JtdyXs5+a6hU0b3c5CUaxA4
         yOleH2L113qOEWnCF4F9Rt3RIxdhOpyADgNNsMkhmlPst9J2riMngSR/S+bn0v/X3PfL
         eXXcnCqD0AAbI6YHDb03MdGGFKTUFJKcso9kTwVmbzrSwmIT1pXNC3EK5BQU2hkhXf7/
         bctg==
X-Forwarded-Encrypted: i=1; AFNElJ8cnuov5cXjwxd5osOb8j7n+DKOrJqX4TrNc7NVrm83Qa+Cx7GQ5hIQsWghhA7DKFmVoYNdnx1XlM1aqEMMWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI2AAtJ2E5SQGtW0zIiC/NM+/c9A5ZwaI7R85t5m9yOSRxHsOt
	uqGLC2EQq0LINsw3dZ6xbdTRo/78FB9e2cHX058yNlZx7kAUvRCt9djbwIMAW9PAbpanoPRSDPW
	zkKwA6V80kFOIy47IYyk8u/K6od+hqO2TpLB66jbY
X-Gm-Gg: Acq92OHGUjhsUQtDGjesXJ0ZkSbbuE9rBE5Muv2UeSSJKqLka9kbJE+u+6D/4/4g/BR
	FTz876fXWs7mK/muuzgaV1tmSvR/W16Bm7YYUF2t7+yvV9t6PAb8t4LcpNnmYvrpIvZjuBLVBA/
	bb9bfaEXEpt5O+3oJxkZ1a1ijqNHbQH/9R354S7pv0Xhw4ymYIca++qhev28v0/ddrXlFfjiYhn
	MLYa2pYvBaBoz3OV1GF8JMdHVM6t02ST8rlMNOww0JlBSSsVtim55lACT2EoHvkv6WvdVm5xaF/
	u0XFuoGJ
X-Received: by 2002:a05:690c:3a0:b0:7cf:af41:50b0 with SMTP id
 00721157ae682-7f7b8d248damr20618557b3.36.1781255867482; Fri, 12 Jun 2026
 02:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-12-wenst@chromium.org>
 <ail2VcubjT7HNGUC@ashevche-desk.local>
In-Reply-To: <ail2VcubjT7HNGUC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:17:35 +0900
X-Gm-Features: AVVi8CeDuG6qw5zFxFcHgtnnMaKWsSajO4ZT4D-k-SPwtRIr1WJR_hE6bMB1VZI
Message-ID: <CAGXv+5GNfWFinO1E=5X46xnBsQpY-_i45mq60eeQu=U3Z0MtDA@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_021748_670806_25C712F3 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, Jun 10, 2026 at 11:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:45PM +0800, Chen-Yu Tsai wrote:
> > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> > UART for BT. Currently the driver only supports PCIe and UART.
> >
> > Add power sequencing targets for SDIO and USB. To avoid adding a
> > complicated dependency tree, rename the existing power sequencing units
> > "pcie" and "uart" to "wifi" and "bt". The existing target names are lef=
t
> > untouched. The new "sdio" and "usb" targets just point to the renamed
> > "wifi" and "bt" units.
>
> Why can we do that? No breakage? Only internal names? No ABI affected?
> Please, clarify all this in the commit message.

Will do.

In short, the target names (which are not modified) are used by the
consumer, while the unit names are internal only.


ChenYu

