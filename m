Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED83EC5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 12:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=; b=yZT2i61Djy7/oQzS6NP04KlY17
	9uBrIBnwNexnlSsBuXkMftLQ4gaW8YtWkuBpskVGzSUeCxgxBOIskQxp6f7jBsw/bUaxBD0isDab6
	SKL4w2mEh7yeBjIgeLStrgr5ssfy34JudzrlZoBzQiYNBQX2uAi6U9LLlxJxHf4QCIqoUbImvh/dj
	gFH2nA2AwIfDee2wMvw58WoVVYTBN+rbPvuWovO7k81aGYnrUJdzatsbE+7ABjRJVrTSdNFvnmYzw
	mKtRDK05JJMK5rDYAm2yOM9XiAGJmFtk6rbS+nxjGL1LKVFD0sAHPGFhR5Vb2/7iyT+Fwt4bydBo2
	/gGlbzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt2OF-0000000AGzf-3LHU;
	Sun, 09 Aug 2026 12:12:31 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt2OC-0000000AGya-3pAz
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 12:12:30 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-9034b6b7674so7354896d6.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 05:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786277547; cv=none;
        d=google.com; s=arc-20260327;
        b=ZnuSqlTR+95Tc8D5yJErQZZ9VD33XPz9iBXoFQQzCOdjlnQ7xCZ3VoBh+tnPZCyHph
         m+S73DgO5eFB9AKnNhWbT7pvHsCyz0TbE8Y0nPSUuvrMPjSbxGyY673C94PDMLNe3h5h
         Djm/eUyxGDcfGwHkfrc8Jdxcx/snkOY0xcXgs/ofsxtit7cuixQBXjK7jPV0CD4zMsnW
         41Ih8YioErQUcgmL+TEUWBId5vbr2FUJCT+bPdxH4HLM4dM4OCfYynrPVv4ul4DkT9fN
         dGam2pgQgbpYFzS18SC93fNZ5qiLUsrDCw7AQ8DEitBexioOSteRNatn2mGmFa3WALRB
         GYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
        fh=o6V02kF+xi/VHDTAYhT3zS/N8Z8bpc4jpTxAkuV8K9E=;
        b=IkfdyhYLLzvAOygPNSoGiex4Qe4LKexXptpOoTBgXwf01jbK2oSSLzQ2CA5duGh1T4
         8vU9yt7ggnBD7gd8DygjRKDIdN/oyGP+tYoYTvmxv/43aBn6/IbIpeszKEiZlecNvm79
         vu9mudUFv+EqKXjtl1CUYnO7SrJlHNGTtJ4jlU4hLmG3TC2RcaIlmOG1CRNguwhU5mfR
         Qhsh+VBvM5eiT0l7DesanUX2cRTuQgctqXsH0toXDw6dS1uMChlYeSrd9olmT8NrU1Vm
         s9HxlHOye3EHYrYAuFFPYTXVo3DVjqFJ8RxeJryLwnt9SJ5exrzOQuD3WRFLg2F+IP+x
         520w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786277547; x=1786882347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
        b=kZ6dL5byDCyupt+QwW+dmtNoTrZNHj9ABpVX/x7M7aTsSuo6ryDMknKpFiqzOFr9A9
         3Y1wCoRIwMN04BpYO+SS56KCcty2SE07AWPq+wiEKOeSf3udRuayt5fIUSIvUOGOILXn
         WbE7C/Bli6p1mvLBlUSa7OSMsjyWzpelyGYO53HnLD9nHyh3xSgbavKZFFn+aQYnqTbR
         xEv7bGuAMfYp/HI1LyzCmW0QjN2g5dmV1FObb0e7nRVzXJsRQjBKQLaKYNSUZZrthL7T
         Y0LVYu8szMBaD+7ibA+KBV4wm6UdYS5nLVVFsUBHmk5L9hNi0fdmQ1WQBXQ5s/lFyXuH
         gjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786277547; x=1786882347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
        b=UoiU3Q2sAPsLWpTlo3rUfOcENKhIphaJJNVlciWhPX+w2GyjrpI07Ip9MtczPmjhKp
         roLQFz0RXrb+AX51PfSh0a9Bn7XwqQPlet+yzqGVSL+PSKWRu4w1M6NHl33Sogo4tkkR
         RKA7UXw4kLn2xfowAEmcjkgwuHSx2Xv8sHMNcDwe8RaYfeiPKr/UBZeBUtuDsQxbO00h
         YNL19ynkrHN9JNKPvOj1yhqJLicIkrYmmUZZYx8fdFOWoI+49d+988Av7sZxHz3fTQGx
         0OTsoNeiAHYNoieWZkzEbB9cW3BJOOsS2fY3Nkm2CGX+c4ZxC6r3Y6SyYPiBlHxSg8Qh
         csLA==
X-Forwarded-Encrypted: i=1; AHgh+RrVlh4s4PTVGTZzkY7DZkbU5Bo0+vYkG4uFI51Ilyk+ywhR6xFXL+KU6AK7aDBddZWjuTXi8HvSOQ9NGhk2Qg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5A0ft0GxWXLkgbmA7TTvWp2VtXyjW+VE8L1qCqBsavmbWfUiF
	eoIIwNnw4TvaHDx1lCaRKZgNEkByyHoOhPxSFbrlSoFcgeO/TOYmpAZGIvrpuBeyJkYwdqcIMe/
	KX9HAFW6zPKQRqMh9CEajoRf5M9EKybY=
X-Gm-Gg: AR+sD11s8GxOOEbQcYmA4Af8Vih2yAk6xvmr2bCZOKedh0pgYLdCeEcg9l51yLfjrOu
	E/HuWbuAwNQ7B+lFSoOUQuAIMTRpSBS0yccgzm32q+QiQIC96J/uvR1mbWLRCDOhTbdc1wosCuL
	s0yYMX9H/gX+8/aZUxt7WjUfXCyjMxs5+U6ZClUj+R29D4BS/RzS3Dd511xCHXaTlSuIwG6cQSa
	Pz3oydecEOzTBfxSK/P6dXoHspMyyX0i5+owYr45/9B9dj/yUVy/WgR/5PCdyLwIRCJy2Cx44Pv
	42ebHaqFwGCWLL4MIGtCywAya4w9guR+Ki0vHHlvqA==
X-Received: by 2002:a05:6214:5346:b0:8ed:1887:426e with SMTP id
 6a1803df08f44-9088126d7cemr445146386d6.24.1786277547104; Sun, 09 Aug 2026
 05:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas>
In-Reply-To: <20260807152059.GA39821@bhelgaas>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Sun, 9 Aug 2026 14:12:12 +0200
X-Gm-Features: AUfX_myzAmsvVlb0T_3tOngECWxC2UoI-Iw4nvKe7r1djj_0kecpEPp7cncj8nM
Message-ID: <CA+_ehUxQfWRRec4q2ZvC12nYAeV2VGm1xCFrTWeN6sEL+qkXBw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_051229_016624_654652A5 
X-CRM114-Status: GOOD (  30.41  )
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

Il giorno ven 7 ago 2026 alle ore 17:21 Bjorn Helgaas
<helgaas@kernel.org> ha scritto:
>
> On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> > On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth@g=
mail.com> wrote:
> > > This small series introduce support for 2-lanes mode for Airoha AN758=
1
> >
> > Just a nitpick, but I would probably name this something else, like
> > "cross-controller lane-bonding mode" or "lane stealing"? PCIe already
> > has 2x lanes as a standard feature, so this naming is a bit confusing.
> > It's not like dual-LVDS display in which LVDS is only a single lane.
>
> I suggested the "2-lane" and "x2" terminology because I assumed the
> result is what the PCIe spec would describe as a "x2 Link" consisting
> of two Lanes.
>
> If that's not the case, maybe "cross-controller lane-bonding mode" or
> "lane stealing" would be more accurate, but I don't know what those
> mean, so if we use them I would also like to know what the result
> looks like in standard PCIe terms.
>

Mhhh I don't really like the term lane stealing. Also cross-controller
lane-bonding
might be a first. Even if correct it would complicate identification
of the feature
that at the end of the day configures the HW to provide a 2 lanes PCIe.

Consider that in such mode, the other PCIe controller gets disabled (this i=
s
handled in DT) so it's effectively enabling the standard PCIe 2x lanes
and apply the HW configuration for it.

> > > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > > normally attached to this SoC that require a 2-line PCIe card to
> > > correctly work (and give the proper performance)
> > >
> > > The first 2 patch address a limitation of the PCIe implementation
> > > where the PERSTOUT reset were indirectly asserted and deasserted
> > > all at the same time (for all the 3 PCIe card) with PCIe
> > > enable and disable.
> > > The 2 patch address this and introduce correct reset to control
> > > reset line for the relevant PCIe line.
> > >
> > > The last 2 patch add additional logic and support to assert
> > > and deassert the PERSTOUT and also apply the required configuration
> > > for 2-lanes mode.
> > >
> > > 2-lanes mode is implemented in DT by adding the required property
> > > and by defining the "num-lanes" to 2.

