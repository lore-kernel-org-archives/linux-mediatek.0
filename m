Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CF9CD37AC
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=; b=qo2vGVTNY2veM1mBqWvQWu2oFI
	UZ3BKKoPRRqQ3IqCs+iUtxxfXJqR5EIjOQyBc0hvT9vnpod/uvYFVYUV4PJ5odgtfkEni8VKzQ5SC
	2w+Ih6lxI2JGrAL+wcyir0Dl2K0fpH4Ek7HWv4z9QaCZQY93cytopeJg4wznqtQ+BcJy7qxvB5iuV
	L6qCNMtPeeXxl9QIHX+jb8b0Nri42IyI+4cyB8qIuegcuY8fPmg+ly6vO1Ks5quNHCESsqMy5AZcw
	rRfJ/aiqbnPSDLMYVXGzg0IWZoBMhb2w3yNSptyVKbrDmUzqw6mqHYqVCvr1MjwyhNWQ8tX4JEtw7
	yEIBh5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNGe-0000000D0Sw-216t;
	Mon, 11 May 2026 09:49:40 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNGb-0000000D0Qd-1GvR
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 09:49:39 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a86e4b950cso2962122e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 02:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778492975; cv=none;
        d=google.com; s=arc-20240605;
        b=HdJSwoLGv56K1ASR2i0g+EEIkFeHxSQcjRx2vsEVVrsFcgu2YnZdBNfiAG1R3WD5Hj
         YrGfEL2MHJs6NvxiMRVjrQxaca5tYj3vlxzZYF5kgjy/5r0NIROoFZX3Qmlo/xYKCmyU
         R/dgoRF6oBSXqtqfQgT2SgFyUYNX3yAfSTpnQX34cvxDgChZoG8sA+rZsvOcGkkcB58r
         t0B68xl5M9d2lkCmU1gzu6Xq+nK10w0A+BSSwzTn/UWmQe+Upj2PyBmB/V7Aj+nQlUbE
         2FOiUlpebmHX9vlVFk7WV67hb8F6aOfRIeQz6nEE2o1zpxiG6LeTWuCoR3Ap5fdvx59C
         R9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=;
        fh=CsvoxCbKVW8fdYiJ2kuTjjP8/jeOsYAxqHokn5BvTB8=;
        b=feuczxCVxoSQ8FVzxX0XzQ1O/TDeyTXM7hw0er8wwE7iMsdE4r3aFijXyttjRRtT3D
         tFxRoGL6rHM5n2wkYYGmjiZ4+RGZ75b5SWPAUfYqhR4ZMoEvkBPHTn98wyCc4LKD0HsU
         mlJBK0ouQHzkqndp+VRM/rgmEWb42VgxSujQq4avL+fw8MyfCj00EctyI2IBAkYcejUg
         /FdFldVhzh6Z9zzWm9Hs0TN2iqkqazAsgIRMeRhC5m5AvS7FOYYDa+n3X1NpKs22oFsl
         gUegiY8Lld1A/xBC5H+PRBnw3LcLhwVIy1F4KyBb7msAEows7Ut7k20dBJma49UY/OzZ
         vB5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778492975; x=1779097775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=;
        b=CgKQMUOQMLmOfx+/QeE/8iMrC4q8gOmLNbMJOgJwFL5CvnJQlBWP9v+yd0O8aRTCyz
         bPxuHrVqWVKD64Bs17kmkQXO6CR4LX2lc5cNgcMP/AoBnaVrEX6sZwiiH0X6z0P9YazJ
         r0wMx8R03yhCfXAUfBJ22kBkmN40kbndC8UE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492975; x=1779097775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=;
        b=UAvP3mjYxdmDT+qWhAgVCVJ1Knj8YGaRb5bXiQs3ui7qD54SG3NG3RNUUvTljeFLSY
         5u47RrCZwklY79tltDunAgm+RPeJIc43/I59jGsEfy4I+WWYWnbDB6QLl+kzFN5zg1iR
         FpaeKaRDojseSq8rJUuiUhUZlkHEj03Sr5uyqUvXa/PKxpR7sb3/lZ03VRwEYmYfR6ZP
         KIK5bF15dEkLdKQpSg3WaNm9SQ/kODNk19EaKK3f5Dpv7gJ27jFEcSYUXn9bxgKRlDp7
         CeLKWWe2KQgJMLpMo3vfiOA0TKNS36TreOlF1SGI/HHf73hJd3/lUPeHE95nhVHX55pP
         R+Tw==
X-Forwarded-Encrypted: i=1; AFNElJ97vfGBnm+mcn2/HJ3oIPfxMTCTG/7YPKxyb5hclsAlC7z1Iq8lhJqhjQK104oZkUa7GDl995BqPWz8PZWM6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YytcZDJBJD2M61orqW75QyYt5Mz2R7w8nXgfyzEgFADq3vil+4u
	W38Od1ebs3bu0BbItWZijQQCpdrK4KAS76/IxJY/5tm6z0pZJgcbRxA8kAheW6gpune1kjNRDjn
	Pt5Ylmj0Pinm2RS7/41BqyFH1m+obu9GgvhYFsYfX
X-Gm-Gg: Acq92OGVo/pegNWAVXum82eeWO+4qDNlDAIWNIhoLeP9q1B0j5Av44iX5LILWbT4FRn
	BJ+t5AA8MER0XyQHHO5CiHHyiGLJzbhA2ZUzZJUGSEQZ2X3VsvVFZjtwOy7IK+waUgzXna3Zu09
	kGsctGBWlL57LhKm6yg4S6uVH5jMooPrZS+n/CWA1f6Qpr7YgdSE+W/GQ5KxqN+ylUWiApsRmfm
	TXEJHHwl0v+adj5wXVYdVp6Du+hBSBpqXe4BnHV+/vorPowqj+jqImeulZipPZC5d9Qjh/EW8aO
	/RHgR0xLsWf9doaDCZUtk4JliHxknf7GA5DutQ==
X-Received: by 2002:a05:6512:10cc:b0:5a8:89d6:93c3 with SMTP id
 2adb3069b0e04-5a889d69612mr9222261e87.21.1778492974942; Mon, 11 May 2026
 02:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260430120725.241779-1-wenst@chromium.org> <177849219930.115964.12285046748812181326.b4-ty@collabora.com>
In-Reply-To: <177849219930.115964.12285046748812181326.b4-ty@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 May 2026 17:49:24 +0800
X-Gm-Features: AVHnY4I2n3jCQB3QPukN_nmGjnmGT3z0Rt-UHUs2BJl19pmL8VcxIKApqqizml4
Message-ID: <CAGXv+5HsrUQ0wb_8cceGZywU-HNxbFehP-NzKmPs6f1q_He4Rg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA
 bounce buffer to host
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024937_392402_CED54D0F 
X-CRM114-Status: GOOD (  12.47  )
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

On Mon, May 11, 2026 at 5:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Thu, 30 Apr 2026 20:07:24 +0800, Chen-Yu Tsai wrote:
> > The DMA bounce buffer is attached to the PCIe host controller, i.e. all
> > PCIe DMA transfers should use it.
> >
> > Move it from the PCIe (WiFi) device node down to the PCIe host
> > controller node.
> >
> >
> > [...]
>
> Applied to v7.1-next/dts64, thanks!
>
> [1/1] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer t=
o host
>       commit: 0f91911b61d06fc02a058ff7fb0a27e53f7b1136

Sorry, but we actually have to wait for a matching binding change [1] to
land, or we'll get new DT warnings.


ChenYu

[1] https://lore.kernel.org/all/20260508063633.3894348-1-wenst@chromium.org=
/

