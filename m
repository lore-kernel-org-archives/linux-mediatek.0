Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D97C982FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=; b=p0uhS5/367SmbJDTcw86sHstVf
	WjkP95cSN3HDQodSGDE9YEujr4T33Fzk/Lx68cOJi0XnNSoHz2HZCsIKWM1XlRFLZB8nP5LPAHXFF
	ptXXz4Xc6h+bF92vRkakGQWxkPE4ZAQtK39UG4e6FhTEpaOZycmhz8zd/UFBI0g00CeSEbVyEAE/w
	+UXvqyjPXvXJ90oGdNJL+iNvw6VCZuUxApm2f1IBnjIs+KPt7Zm+XX6neIQeui9F+6kLoS10PX99r
	G5JDX/eYI0i3Maru+xqQvDqyh3y4lDb/rvwH910QmXfk5qA+vkucmIVuYd+O/rMc7Slw3uQf1hId0
	9OrkMfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jg1-00000007onm-3euX;
	Wed, 23 Sep 2026 09:54:09 +0000
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jfu-00000007olh-1yK8
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 09:54:08 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 00721157ae682-89666ee9b3bso8071357b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 02:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790157240; cv=none;
        d=google.com; s=arc-20260327;
        b=Lth3dMr0TH4vqh4fAMq3iMRPfXoTDBchyjdoIKYEFX8MNy9uTnjJvz8+wc+yN/PbCT
         +kfaUAkcI5597hpoHlFv7h4nciFUAJj9pRNRCTCcP5HsY3tF58xDRkw/UK3D2SXsWPIM
         fWGn5EHR+wEc8niOhFwYQjguTNpryw4nFbFI1sCumlCIlntbzJ4p10AePQPAE/7P10nW
         Sf8d/3Kl5FMzK8YjsDBYN00z9ToFMJXCRK+cvsS8/ln1sTexMG8cvEIrnqhKFPVGmYfm
         GLE8LAuZ6IJJe/M3HU2GI2BZ7B7RMgqD+1iKkNqLUuO4YhMgynJ8XtXxpQwu6i7CGOWT
         vlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=;
        fh=Oy1V/S2bHHikmERJcyPBLmfWyArHsGp52mOhqSKhL4I=;
        b=h1QVLhngnjb/8w/rjgenfc/Xm6XtStRQc6vMhkwEvQsAVP0tpnIR+Mea8nA7d8gtsW
         lBpsvGHtl3B1ABBFuPd19Jo0dV9o13evHoBAmS7bplnBYpdrpe5WpFglNX+TBgkMqJgl
         F5/qsGf7tVsEVQ+tFRhZgmn7rPtxxZeYgPifs0GpHmZ6/oNET51LMrepcnqkv/mz4Gq+
         YFKbR9Sz4nLtu4Z70FgaFehxkiLMsntad7gj7AazdHlxJewI/H5m1th/+eZ/Kd5fycOH
         ePXqXsc5/kBweHSb3dZffoYI1NIFcsQ6pUSNP+eSKdhUmcCNnDlEzSKL2V19m2RnpOMF
         utEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790157240; x=1790762040; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=;
        b=ZodQ5fjtznPjJ6NODg6QesSHurwKpAUt67cun0ERWB6oGtxmmiz+0x3637OpDjv09J
         R/MKtQTlV/CZBCdmyNkQk91E2TqK3W2NpJKT9lFey4jPPgP8iKho61QtyDK58uEXH8Ab
         TIDk+unluDXczvxgcfJIq/O+LhNkTHl1Oa5G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157240; x=1790762040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=;
        b=HCOHlbimJvZ/FqKgzt4zujHWk77e8By7LoFN88iNV3O7AFILhBxlAQn1FDm1nZyLny
         NU29kPl6ij9uFb/CPe9bvh9cfsmRBIy7ZFM80BJYV7c09V7saxrqyZc97tFZLmI1lYKL
         HFbNYhUWAZIibEiDMjKoJZRLyPwA66+2Rkfepv+TCeg3jsgwUwqyYyKkmWRW1EgJykR7
         5mNy2lq6S9XSeyfaooLl+Nqg0PTUGhVKew/VPFCT1iB3ZlG5j7Q6pM2OqmvwHrkid4k1
         Ok6aZAJRM2vx9dMMgKeql4I0+L100nzlmYBSQ0SuOVjQ5qOJuBd0ntSEYBacB6+T3MWv
         hK4w==
X-Forwarded-Encrypted: i=1; AKwUvByxB2FCrfnUAz9RG76/7J31PrTRVFq9Fub017IeYL15lrtANUxxdlI9PE5yB0dlQPPwudmvwJYMnxIZIOn1ow==@lists.infradead.org
X-Gm-Message-State: AFuF++mNkj28bJhNl62KxXBWEiyPp9FgpuRdInQl5nXR8lIWxMlJ+6uI
	aM35o7CzzVXD/GhiBgTdgJT8NNeGJsUA8i7PDIBDYGb3oZB6ns96eiPD9Mnz/h/b5/JM9kw9WnU
	niCc6RTU8w1E1ethZ+0/bTbSwwzSp/C8rVJrpbyki
X-Gm-Gg: AYBFou2grFvCZMZIBsnu+rgqCSquu4U7GYeZxVznlUdotiOzacfOADuW4gKtUIF7ZhA
	JnCiPmkUAVdNJfEPmse+OED2s2ZoJOES+V4FpGRHCxR2UqBpVLhKji6ffmA9GAv6e60rZbg3Zfy
	O8/c1/Tqn9ku5kgzuV70rQCfBPET0mN5nu6w5Ss5lKAdz/va4VhmUqS2+JhlsyUJnQCLqRiXJki
	zlr1/Qc2r8N3GXKl9jxA7o57KwRLswp2UBj7uuUp/LrEICbUxyYaUx45k5ZzN1OjNr3yKPUZJPR
	SY/mJmkOhEFp8mt4+HNrZjj++mLJmjTLmGkZfzdXa5ZK/JroOOfddXpg
X-Received: by 2002:a05:690c:7011:b0:89f:4c20:73d5 with SMTP id
 00721157ae682-8a457891187mr16275917b3.6.1790157240628; Wed, 23 Sep 2026
 02:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <dac8ddf07cb1bb79c70d5a516f0ff7baf41eb462.1788507854.git.liujiajia@kylinos.cn>
 <dae8ba2edf89e35c44748912aa466f3b9c8df75b.1788507854.git.liujiajia@kylinos.cn>
In-Reply-To: <dae8ba2edf89e35c44748912aa466f3b9c8df75b.1788507854.git.liujiajia@kylinos.cn>
From: Ying Hsu <yinghsu@chromium.org>
Date: Wed, 23 Sep 2026 17:53:49 +0800
X-Gm-Features: AcwNN1XyckWCvbLuUPclr9L84lJ4nL1-DpksFwXIj_myJJABSYaeMKkWJtFwAPA
Message-ID: <CADwQ6b6626zB1+Ms5JOSjp3fP0RJrE5BiQFqMh8Ra1c_QFVgmw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Bluetooth: btusb: Fix leaked runtime PM reference
 in btusb_reset
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Archie Pusaka <apusaka@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jing Cai <jing.cai@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_025402_534365_29A58C4D 
X-CRM114-Status: GOOD (  26.45  )
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

Another way to address this would be to let the USB core handle the PM
bookkeeping instead of doing it in btusb.

On Fri, Sep 4, 2026 at 4:04=E2=80=AFPM Jiajia Liu <liujiajia@kylinos.cn> wr=
ote:
>
> btusb_reset calls usb_autopm_get_interface to resume the device
> before queuing a reset of it, but never calls the matching
> usb_autopm_put_interface.
>
> usb_queue_reset_device ends up in usb_reset_device(), and since
> btusb provides no pre_reset/post_reset callbacks the interface is
> merely unbound and rebound: the interface device object survives
> this cycle, and so does its PM usage count, which is not cleared
> when the driver is unbound.
>
> As a result every reset permanently leaks a PM usage reference,
> preventing the interface from being runtime suspended again until
> it is unbound.
>
> Set BTUSB_RESET flag before usb_queue_reset_device so that
> btusb_disconnect drops the reference. If the flag is already set,
> drop one reference.
>
> Fixes: c9209b269afd ("Bluetooth: btusb: Introduce generic USB reset")
> Assisted-by: Claude:qwen3.8-max
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> ---
>
> Changes in v5:
> - no change
>
> Changes in v4:
> - do not return if BTUSB_RESET is set in case the first reset failed.
>   (sashiko)
>
> Changes in v3:
> - handle multiple reset requests int btusb_reset (sashiko)
>   set BTUSB_RESET after usb_autopm_get_interface. If the flag is
>   already set, drop newly acquired reference and return.
>
> Changes in v2:
> - Fix the race window (sashiko)
>   set BTUSB_USB_RESET_ACTIVE flag before usb_queue_reset_device.
>
> Changes in v1:
> - add usb_autopm_put_interface after usb_queue_reset_device
>
> ---
>  drivers/bluetooth/btusb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 6f7946709266..61c18402911a 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -1068,13 +1068,15 @@ static void btusb_reset(struct hci_dev *hdev)
>         int err;
>
>         data =3D hci_get_drvdata(hdev);
> -       /* This is not an unbalanced PM reference since the device will r=
eset */
>         err =3D usb_autopm_get_interface(data->intf);
>         if (err) {
>                 bt_dev_err(hdev, "Failed usb_autopm_get_interface: %d", e=
rr);
>                 return;
>         }
>
> +       if (test_and_set_bit(BTUSB_RESET, &data->flags))
> +               usb_autopm_put_interface_no_suspend(data->intf);
> +
>         bt_dev_err(hdev, "Resetting usb device.");
>         usb_queue_reset_device(data->intf);
>  }
> --
> 2.55.0
>

