Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701ADC4450A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 12:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxlN32iU+dZZDeFlRrMUjrZz0IkcNsY0YbDQ0qDA3v0=; b=kovbH9uzA5/ac/C5LwHMPbuhkh
	HoI5Ig8iQ8HiJFsk+m68t/SjUjlOVvxFCMWURPfIP8FaOIVSmJk4tCX4eY7e45/UDBhs+GxFscz+4
	NNAnJai4jQxQnH/KVR4paTUh6ob3wNRronxf4+9n5JMZqy5EwYtMPCUNP+kSTEsRj3C6uV6o5oIAv
	2Bzho9xjgDfu20DoMMUjJByGHIL9hgxFlmHX6xOiI+kFDt7iPSbJFelT3PzOhXVSAZyRLMpRAKMnD
	eFJpK6Sgy3VO20AlCX+W4rgLHd6kFoBrEIc11Bh+PY7OMHoKePiWFxPgMkE2gCNZ/VAox1R9pKxF3
	1aGBylsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLNg-0000000HHL9-01GF;
	Thu, 16 Jul 2026 12:40:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLNf-0000000HHKq-0wyj
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 12:39:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B3B9243A0E
	for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 12:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DB01F0155C
	for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784205598;
	bh=OxlN32iU+dZZDeFlRrMUjrZz0IkcNsY0YbDQ0qDA3v0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WqpCPouGxXPy6ueFZIiDKndTIcSseLdOW8zJnpgFBSNSoDdKIk/7PbT66hpvii8lF
	 xpGFkHf70LHbzODC2JX/8bknW9AW6hST0M5fCOTn22Ej91WlStU4IXndhEeMkjZpiS
	 FuzbYk7mi+RMgrPZJDIL+OOZfj6dhWIPtZW/Bw3DIguFX3YILXjlr/Om6RgxEe0+5g
	 OvRqs4AzBAP4e4J4WGePbTy/doO1ETuJXTc3TJDSwkcxYHhoOYotCja1Rjwwj2npSn
	 eieU4XXRFGXQiZnP2TA5NVDbGO824HC76MjX7lmsIRls38P0dfhkCaGZfjVgAgftPm
	 g6IOG5Nv4SVbw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39ca300db70so44543881fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 05:39:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp/LqEqzf+kK5O9o8DU44eVtHfQOrhqU7dQkrHJ3moralrpxXC3IVIMNd/IADdiYVwlqsg+RWZ9adxFwrIywg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTTdN8H/hCqLwqV/tCD0c4X8/GeYZ/1GRzixxXOOe23iEdj6vB
	MNqKe/tta1bnka7iry3eBJ5lCEE3vR+VovBTbpO70AaPj24w8nMYwF0+ArRNeztxwRgL9dcrRH5
	7LbZNfAI3ZCOwGSp1pKR0O/5olmRd+6M1w0GwWY1DHQ==
X-Received: by 2002:a05:6512:4045:20b0:5b0:2176:69f6 with SMTP id
 2adb3069b0e04-5b15d7a50b0mr1154487e87.37.1784205597254; Thu, 16 Jul 2026
 05:39:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 05:39:55 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 05:39:55 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5G0Ffrh-8UohJuGPQ0e7KGpy11=X7t1JtDYLTJ_tZgMCA@mail.gmail.com>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local> <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
 <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com>
 <CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com> <CAGXv+5G0Ffrh-8UohJuGPQ0e7KGpy11=X7t1JtDYLTJ_tZgMCA@mail.gmail.com>
Date: Thu, 16 Jul 2026 05:39:55 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcpu+k-zbY0bDf8q3_9o3qNsrt6uNCao5j3qQLnbjHYAQ@mail.gmail.com>
X-Gm-Features: AUfX_mzb6SG6AJl8tXyuIguJLZaf_DB4m_xujG-Tq3VPuMJuPnQWayz1ClA2bP8
Message-ID: <CAMRc=Mcpu+k-zbY0bDf8q3_9o3qNsrt6uNCao5j3qQLnbjHYAQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
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

On Thu, 16 Jul 2026 11:39:19 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Thu, Jul 16, 2026 at 4:14=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>

...

>>
>> There's one more use-case where the power state trully can be *unknown*.
>> Please look at the proposed new function from Loic[1]. Here we deal with
>> targets over which linux has no direct power control even though it may =
still
>> control some of its dependencies. This is where an UNKNOWN state may mak=
e
>> sense.
>>
>> This is where I also floated an idea of renaming pwrseq_power_on/off() t=
o
>> pwrseq_vote_on/off() for better clarity of their purpose.
>
> OK. Would it make sense to revert to returning -EINVAL if the descriptor
> is NULL now, and then add a different error return value if !controllable
> in the future?
>

I don't think the latter part is needed. A non-controllable pwrseq descript=
or
is still a valid object and has an address pointing to it. Returning -EINVA=
L
on NULL descriptors is probably all we need.

Bart

