Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F1CD4851
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR8EnK64dtfqn5p2qNUwy1xl1ufX9OqaX2p8lb+U5Dc=; b=lnzvSLyNNP7n9jTjhVmI3vUoz1
	kE09mmdo/zsDzPb2gz5dTp8Nl5vqf1VM1qbEadjp2XCBD/rh5QdyIMtW29TZtUK9yjt2kO/x0F48Q
	AAyi0XywOQvCIwpQhn19UNWC9n2RhhiFUuTWmh/ceUtqqbvzQ3EG90bKW15YnJTzxsbYmdtoHhCyg
	BNA/t/E7V8VlmZUytBhQs9wElFA0G1Xv5hlGp4WK1tmIvw+TUbf3Dtd26XEoB2bLUUcjnO166Rd0e
	YNmA3OFBoUEKh+3Fmj9EHM3OhmkrdvEhzFMMeMls8OIlrQXMk3A0BthgGtQ0d/IwJgZRjGZ82rAmI
	rzl9GzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQu6-00000004sEy-2iFi;
	Thu, 14 May 2026 07:54:46 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQu3-00000004sE8-28kO
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 07:54:44 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so55431511fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 00:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778745281; cv=none;
        d=google.com; s=arc-20240605;
        b=DG/DtHjN+LhXZUl87365OGo4H/d3ax5fmOX58RbMlJ/8sgu5a6GQmxrfsUw81dX1Ic
         YisXKsVR0PEHonQSTl/uzUs0CaYxaQkZQVvDsQcgBVQbV34PGKGcNk3Fa60p7bAY6uAR
         kx3+m5qJ/8KUJ9uxHn0id4olbbbQ4jIJ9J66ADhBz5RCBa2troOWhi52o8fD1P8s68sT
         9gUakZ+6t2zsjd1+rBXiZJ9z7P7U7G5mjOQ9ioetYIdDsc03QssCxkTre6HSrMJM1fFc
         pyxqmEYPzAsFIqEvCpTPnPJlQHy6Ft3IXUXKirSD3+N30PDnmZHmqQmJcF5UG09LjnWu
         mX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XR8EnK64dtfqn5p2qNUwy1xl1ufX9OqaX2p8lb+U5Dc=;
        fh=g8Zga33zH8tpm44F4M3so+txs1u7/CgU14MP3qMZciE=;
        b=PLc15ttFtuxGe4IIfl5wgD5Bl1dGVNAfacph7ZJS4ZAGX4ktxVGvr2x8wneAarnXbe
         BW5weRLgP0OFhNoYn4Nh9IfpvLKQ3pIEaho+M7tf3p/X9smKq8vah0FCLKPzs2yrxKMr
         urX0FYaikVx03Emvat0vP6kmw8efFPdl52e1EzRDU0ewpIOuwAmBBiNfwCJLb8bteqj8
         bp4ETQE4A5jtKXlBjiAq3t9231+29DBdqexXsxJonIq39oH6rSl/1Paxm62VCU+5bAmc
         FBk1LeyAurLCmLn6dn5Gh21rZhsYBBa4BilXNH/xgPaZdfwdYAsTvX4ftmXtUHTvFU5Z
         QvuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778745281; x=1779350081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR8EnK64dtfqn5p2qNUwy1xl1ufX9OqaX2p8lb+U5Dc=;
        b=iLLMJBP+7pfC94DAC0WiqyJmcB4rL3Lsm6g/NsEmZ3QsHhMyFLYlrvALaEDDDJ26mE
         C8YFfuyPRxTBNYabDoqJNPcQLdL1pOtThgf9tOuMGmypvYourRmAhY2zNEU9d86FV+jM
         gj6xidy1D/BEsrdyQQ/7I8UB1qqkZB+kPuQIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778745281; x=1779350081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XR8EnK64dtfqn5p2qNUwy1xl1ufX9OqaX2p8lb+U5Dc=;
        b=rRVOvftM34hXHZvf0abMloXaVmVl7ZZSdHsg9yZgXti2yDV91qOMb0AQkQ0Qy2c10K
         vjQ7LHnPK2lP2LppLWXZ86Uxm+qhIMJCR7zXOu/r4DhJjWodJsYbnnFxnnvomhfIrsEd
         Dmr3dQjtwv2I5uC+63zo3dXDenWj8dAU6JM2XDksD9NLra2Q6lIsP78d+CkmjpDb946L
         BvigvMUa1n/I7q1XApj7YAta3QiljENeb8rWyUWOWUxcxK5UPlaLDCLfpnGS6js/or12
         eFVw2BOFTwBxqR5YwXosMp7/AL5njv4EyHp9PCFpEp8XSgfmDqVB3SD7MzZ9zeQuY6Dx
         L3VA==
X-Forwarded-Encrypted: i=1; AFNElJ8qu79lU0pITasiZ3tfUJ45KCJULIQsFaiAbba3vHvy08Yu/qKyWQ81GPSHCOWx/K6V4iz4+Yu/p04/EF7JDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4xw+AMvRN/b8HeTFY/ptBa6jlE8iFHopmGBCmkg4UTzeHqEzU
	cLCFB4EvV1JViucaW5ITW2Nceaw2bTHNYzS0oLh3pTxiAn0cwjjvCgJ9TmISKNtGq1Q3tAyNlAQ
	LC6d3/3RFVz1KC5AmuXXouEp2zo/fu+/ZkGOuiEQE
X-Gm-Gg: Acq92OFYLWGdwM3fBQ1bZFwAcgG43EFe7xhWpJK1lPjZpQd7/91vBzdwgHNKXeQPNc1
	/o6Di0ykLCio6w9NGQSSxuQCEIkxxOkEvBjZgwvdGHY7yNwqUhmdxMC5nFMcFCBVKVFRrhyDFoq
	QoDLDn2dc0psvxZW9DaAKFsFXtpfALNqcvu6Ewx9cFkrpiuqo2vOBdggATrjbbbbqDXyMpM66bp
	cl6+TU5tzocXRhqefe6oof3BuZqOMLEcbsxTH4ThKyWMPEGILNJFo5qPPtRpUmBOHEUOJ5rXhvC
	xNQfqBk3MneI3RJZieCbnwE5DD/jxkgH7G0gjw==
X-Received: by 2002:a05:6512:1307:b0:5a8:e363:6f7e with SMTP id
 2adb3069b0e04-5a8ef947b4amr2826701e87.17.1778745280832; Thu, 14 May 2026
 00:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
In-Reply-To: <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 May 2026 15:54:29 +0800
X-Gm-Features: AVHnY4I-K0fe_Bfh0y4hR9dkGGPUD3Wz3qssE4qO52Iohr3iuH-UNE1unWWNmOk
Message-ID: <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_005443_598678_82E55F37 
X-CRM114-Status: GOOD (  17.75  )
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

On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > controller memory access could be limited to a small region by the
> > firmware configuring a memory protection unit. This memory region
> > must be assigned to the PCIe controller so that the OS knows to
> > use that region. Otherwise PCIe devices would not work properly.
> >
>
> So this means, the PCIe devices can only access a specific carveout memor=
y
> configured by MPU for DMA? If so, you should use 'dma-ranges' as suggeste=
d by
> Rob.
>
> 'memory-region' also serves the purpose, but for PCI, we have the dedicat=
ed
> 'dma-ranges' property.

I think I need some sort of guide on writing the 'dma-ranges' property,
because it is not working for me.

I'm adding

    dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x4000000>;

to the PCIe controller node, and dropping the memory-region. The WiFi
driver subsequently fails to allocate buffers:

    rtw88_8822ce 0000:01:00.0: enabling device (0000 -> 0003)
    rtw88_8822ce 0000:01:00.0: failed to allocate tx ring

This is dma_alloc_coherent() failing.

    rtw88_8822ce 0000:01:00.0: Firmware version 9.9.15, H2C version 15
    rtw88_8822ce 0000:01:00.0: failed to allocate pci resources
    rtw88_8822ce 0000:01:00.0: WOW Firmware version 9.9.4, H2C version 15
    rtw88_8822ce 0000:01:00.0: failed to setup pci resources
    rtw88_8822ce 0000:01:00.0: probe with driver rtw88_8822ce failed
with error -12


Also, using memory-region seems more straight-forward: I have a region of
memory dedicated to the PCIe controller. I describe the memory region,
and assign it to the PCIe controller.


Thanks
ChenYu

