Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E8DC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 02:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RzIbPzyaxROQi2DmI6cNz6eEd7xiOCPNeCs2VmCd4w=; b=N6J2BXn9WIvQDSv5e1STvzABHa
	Li6NZuqS46Ac64hmyjJl8d90GPHLX7yE66YdoVRihtl42edf+d/uFtuKPVEMLjSd2sp6y+6UV6XoR
	ZxWqPreLcW8frmhTwCf63RBpdUxCUBGBIgAx0/rirsPPxHmI74c8KeC1TUv+Hux38zUQPMhMEDvoi
	C7vWlAMzAaDUbv8GKdDrH8EvT7/lmKGnCoFG99jyfcGp33mNCvNTeDPgouHnDqSH8jsU2jxiQhBxb
	iZUOR+tmeA2+PrL4NT0tkcLfZlg0k+fod8Tl5blDXFYnnkGTrD8hp1nzBNSM7KYACdCs9iWWYP2Nw
	0JvFG2tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheoD-00000000rn1-419t;
	Thu, 09 Jul 2026 02:48:17 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheoB-00000000rma-2AH3
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 02:48:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so548833a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 19:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783565293; cv=none;
        d=google.com; s=arc-20260327;
        b=dz0zKkILoKwHig8ryWH8+ZW8HbYGUkbGnWyLD8E+L1YCjrEJTeYR8P96wqVRC8F9dJ
         D+jhlMtGf07PbAzrK/Hvov9Ij9LYv1PBg56pzsrVWkP6QenPAnoApDd/FeRds9fuIlJX
         DuKREOulkq7lbfDRV/d50MM6rDy1dfVlbJI1RIFhvduQ8DWCHKTup3hNrYSL/iqYVhLh
         eGdqmIEsl2muy7TEqIcGkiSwpVtlK9aEEo66r4Yzw33ylQgt/Gdq7wLEKNg/5j9UT8bx
         1HUsylwn2x/1eFdoiIBurHd2EGDwJZDEIovn3MwV508oAW0CHi+5cJ0jTotceqEqY9BA
         rBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+RzIbPzyaxROQi2DmI6cNz6eEd7xiOCPNeCs2VmCd4w=;
        fh=KRwqo7DIcKz5V3eO7IQoCame4602+ag6BOKs9yuEApk=;
        b=GiwNMo9hEIE4PT75tKSLuBK8CNMBM0naljUFTTISJodOU6tkb3ePnuvCvE/0R9od6f
         c18QUiFxesRkyRhIPu4v/Np7tZIex0I99VXeEc0SLmWdAoMG5BGMM+t/jmVVKh+U2rIZ
         XRUKj8KORKWtliqHNC0I9jvA4KoBQKzj5+0zJRLeoEMSBdSdtrOgo5if/sgGl7zxuh3f
         rJgCeivJrcBGDyizdt/ViDOCl7Rb6iRGVDhgKOemTmaztXqVnh8pHjq8c+WBXey+FTnc
         IwccSgBVsIssxCAAb7x/VpEYHaBtofOCFLh5vwYdwh3hTbUhgcBIe23YkZ9ocUf4fksB
         Jydw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783565293; x=1784170093; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+RzIbPzyaxROQi2DmI6cNz6eEd7xiOCPNeCs2VmCd4w=;
        b=VzpgRmLGOpTezRyhpiGMaYraYDfLFxQupj/f6uPGWPlPNb9y1qzirqw65KrPytihIE
         wbyxKaWzxAxVP9dq+k+zes3fHSoTTvoYZGhvDGxpUalekJOITIV3ymjZFvvkQbh8KKsr
         mP+6NWvW5Bu+7mukMQV+qQZZKOpUdGfnjq0DnJtWuDWCnqQa8TvNncYA/xDY1kQ/hMHj
         M2zGqXVTEE0+nNuFd4YhNKzUBkYZMTMHi+6mUpJItJ6/vJSOcS+6+263Tf2gSs4Gf7Hk
         MDApU72lFh8DiIWsQxa5Y7vdpXh3+W64D6JUSKR5Zo43+EU6/UM/8FAq2Kkqi+O5RRo2
         MFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783565293; x=1784170093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RzIbPzyaxROQi2DmI6cNz6eEd7xiOCPNeCs2VmCd4w=;
        b=sydULNMnXhWMCAUTiwDK+hAqk9wb0V9MNS0s8zX9RFQKkUOEaxfvuE5rs9lJyubi7Q
         92VdSPX3uto/wb31G42TVNqQuSEi1/eY6Bl/fVXtUGxbuLg1LWGOUzJ5sTKzDm4ofc16
         Y0nSE9mfNMeMuMZcV1oeDYjMAVUSDBmLN0N1hhSMMDJqC38xe6vVK/N7AqG4lYU/reQE
         MQIFt92dF0iC/7VhKhSkPu97KiwPMx29k6BYfyXqwsVlwzczUPQ6IEgs6FwscvCPwoYb
         sIiZlcVRRb3fIt2ZHPLp095uwgm/bdZu6awutxXyNFO/9DYAkrjfBJXbiDBmbwpG5oU+
         WKBA==
X-Forwarded-Encrypted: i=1; AHgh+Rrrzt8VfZABj8yUW+6FavEkZo29BTthvK4b/3waP8NTmfXeYP8DEvcGV6mfQzqXUi8rakV3GUbxtr3hGASvyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz53cP+V4wuA0A3obIZMTK2MYE+Gbm6tVUCmTAuYynZaGYf37V9
	JIdbl53Y4RpTM2drOtuV5bbM/vHsHpjRzXPZmNtkscdqEkcsVw61smWiLmu2qnqzIIgvZlAkZ+a
	LyIQmWqoCesz3pyjWeNmX1whcjZquuTk=
X-Gm-Gg: AfdE7clQR7LWBUrw2m429HoZzDMdmD/Z5iN6NG449VA49VybNEmE8+Fog2FL5dJUhhC
	0TSn3efIElloCkQad1xqUcNQyWsCeeb4Fa4PMgzn0NtVTAKd8E9qLG2LL2xXxS2EG9a6GzZH+08
	nVOqFB2+Zd3tYrbCctoONoZhjxDQgocA8LnT/7TPc9lsj0QuzXzaN/nmxbR2cxBnzASsbInkW61
	2+RAYBLV/9MInsmkPli7BbCXKhDx0Qf7iunQDnJttn4jz7BYqkPcBl/614lbboLuH2ulkkn4i1q
	0yHACKiG
X-Received: by 2002:a05:6402:2b90:b0:698:3b7c:7e50 with SMTP id
 4fb4d7f45d1cf-69ab44aa1a2mr1864953a12.38.1783565292883; Wed, 08 Jul 2026
 19:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260630144831.1109-1-hujy652@gmail.com> <20260706101044.161059-1-pabeni@redhat.com>
In-Reply-To: <20260706101044.161059-1-pabeni@redhat.com>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Thu, 9 Jul 2026 10:48:01 +0800
X-Gm-Features: AUfX_mwdocD4sBig_WoK4SaEZrNCS0Q_Edgdfsxn5LciBLfJp0MkFDpcIGf2CVc
Message-ID: <CAHGaMk-=0FfVq_73mr6wcn+3XaGXRJZVTbBVEQ3uTcYrBhdNtQ@mail.gmail.com>
Subject: Re: [PATCH net] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for
 non-DBDC MT7986
To: Paolo Abeni <pabeni@redhat.com>
Cc: lorenzo@kernel.org, nbd@nbd.name, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_194815_607100_C1CCE3B2 
X-CRM114-Status: GOOD (  26.90  )
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

On Mon, Jul 6, 2026 at 6:10=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> From: AI Reviewer <ai@example.com>
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev/
> ---
> net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
>
> This commit updates mtk_wed_start() to configure WDMA_RING_TX(0) on
> non-DBDC MT7986 devices. It adds a call to mtk_wed_wdma_tx_ring_setup()
> for v2 hardware if the descriptor is not yet set up.
>
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethe=
rnet/mediatek/mtk_wed.c
> > index 10d9beaae3721..2420557f6c966 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -2334,6 +2334,10 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 ir=
q_mask)
> >               if (!dev->rx_wdma[i].desc)
> >                       mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this loop need to che=
ck
> the return value of mtk_wed_wdma_rx_ring_setup()?
>
> If mtk_wed_wdma_rx_ring_setup() returns -ENOMEM, the hardware registers a=
re
> not programmed, but mtk_wed_start() continues execution and enables DMA.
>
> Could this lead to hardware DMA using an uninitialized ring base address?
Hi,

I am not sure how to proceed with this one.
mtk_wed_start is a void function and both mt7915 and mt7996's dma
function that calls it don't have return value handling either.

>
> >
> > +     if (mtk_wed_is_v2(dev->hw))
> > +             if (!dev->tx_wdma[0].desc)
> > +                     mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_R=
ING_SIZE, false);
>
> [Severity: High]
> Are there similar error handling concerns with this new call to
> mtk_wed_wdma_tx_ring_setup()?
>
> Like the RX path, if dma_alloc_coherent() fails inside this setup functio=
n,
> it returns -ENOMEM without programming the hardware registers.
>
> Since mtk_wed_start() doesn't check this return value, it will proceed to
> enable hardware DMA, which might attempt to use an uninitialized DMA addr=
ess.
>
> [Severity: High]
> Does the check for !dev->tx_wdma[0].desc prevent necessary hardware
> initialization after a warm reset?
>
> When the WLAN driver triggers a hardware reset, the WED hardware register=
s
> are cleared, and mtk_wed_start() is called again.
>
> Because dev->tx_wdma[0].desc was allocated during the initial start, the
> guard will evaluate to false, skipping the hardware register reprogrammin=
g
> for tx_wdma[0].
>
> Will the hardware DMA end up using a zeroed ring base address after a res=
et?

During warm reset, MTK_WDMA_RING_TX(i) + MTK_WED_RING_OFS_CPU_IDX is set to=
 0.
Other parts are left untouched.
After the warm reset, mtk_wed_rx_ring_setup will be called with
reset=3Dtrue, which also calls
mtk_wed_wdma_tx_ring_setup with reset=3Dtrue.

reset=3Dtrue will skip ring allocation and call an extra mtk_wed_ring_reset
but for non-DBDC mt7986, this path won't happen for the tx_wdma[0].

Usually rx_ring and tx_wdma are paired together but this is a special
case that rx_ring[1] and
tx_wdma[1] are allocated but tx_wdma[0] is still required.
Maybe something like this would work?
Runs only if wed is v2 and rx ring 0 is not allocated, reset only when
tx_wdma[0] was already allocated.

if (mtk_wed_is_v2 && !dev->rx_ring[0].desc)
        mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE,
!!dev->tx_wdma[0].desc);

Best regards,
Zhi-Jun

>
> > +
> >       if (dev->wlan.hw_rro) {
> >               for (i =3D 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
> >                       u32 addr =3D MTK_WED_RRO_MSDU_PG_CTRL0(i) +
> --
> This is an AI-generated review.
>

