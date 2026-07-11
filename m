Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C60EC43458
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2026 02:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ve+KgfwCf7WAv7Osnu4Dp5X81+V4g7CuHLm8wADOA7c=; b=vkU+LDtJprdDmWVSTNHUAY89Yx
	wDOq/09/b/IJaO2JaOZ0n1kPQORJkDT65+KUNJr5nZJKIhUYXb+/+9PGv1TU7jt62fiQaM+9+r6oY
	IQxM4gl9mjZCqxQrAQy8pUaMn7IvRcl5ECuPBZWEcuxqp9cA4+MFi51qRGDV66LZ9L5nAUBzMGD23
	XxUxrmBR0O6V8DGWvC2hyRXFVAiY7bkuJsmTln3b760+9yRfKipPsH3qdIvIlcF0YWk6p1rKytzDa
	0Kilv/4kqD434MgYbXEhfgHLZX1RVWOJ2X4epX22O9UgBXKDCLLqezdrIdyLq5mQ6VlELdUV5tLfh
	KlKvhwMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNec-000000069CQ-3c0i;
	Sat, 11 Jul 2026 02:41:22 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNeZ-000000069BZ-3ZzW
	for linux-mediatek@lists.infradead.org;
	Sat, 11 Jul 2026 02:41:21 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-6679d88abdcso2393612d50.2
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 19:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783737679; cv=none;
        d=google.com; s=arc-20260327;
        b=IO0YGIbL6ele2H3h/wUBd/4Hicw7yuRAimGW2coe8MFsD76OUGeitizPkCwL7ndsoP
         j1yCzaJnjD4JHKMBq+AX8Q7U2lZTjC6Oie8j20DyDJ8I7+7wATClfjnBWaNu1EbXenKS
         35Fw0QgS25651WmTNRK+W2taKoKDev8pUMf0RQUXBlTPHDd15xg1zEEoNaqsJXIx6IaJ
         FiqW9AEHF6o6YmvqpwE9zF6NGaXCXCwjch616LZskJog1Pc4+2p4J7xNPJJO3DY/wvAh
         ZjBPR9+VA1BOwUyz606PN2Z411jJwt+nAhdKICfTkt0SNScskZLfuPoNbBkWtSZPPRgx
         DbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ve+KgfwCf7WAv7Osnu4Dp5X81+V4g7CuHLm8wADOA7c=;
        fh=I+zaFPfiNcAs3lkb882PXQzZmYnFwFUoHtvaBheaoJ0=;
        b=DiZfWLIGwKRIizT0J8u9srO2vvD55G3n2g8F096Ktf22iJUMhXN8YjiT1Dqdl3yXVu
         y4HcPyfyUEVminQWp3eAnshTRmjW/5T8cex9y8SpMLtJ13uF74RhGQBMVTtWpnW7nRot
         S7N4+GKuvpAXHPCQHMp2Ntz0IIV+atwNx2Cx9CYBZkt5fGSujrA1tJXQs2lpzPDknBWq
         9EgfTsMiXRlULnDZt2typLfCj9qQghVZbLZNSEyBPq6HXw2SYuHN03+awmOCZcOi9od9
         g3ZknjIgnrao79VpN2OrYoxCinyUDu0BqLQKFQrFq31jBNPRkyXjP1QDDjuC/l611di3
         sM8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783737679; x=1784342479; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ve+KgfwCf7WAv7Osnu4Dp5X81+V4g7CuHLm8wADOA7c=;
        b=UjtOnAthHxR/pfchgH8Dpo3CsiPkaIxHFdKrvcYLXBpZTqTh7DVUB/3pgSsQSTEf8j
         M0H9hmqMHRvyCo7csOXaKMOMy3WceWPg6FsQEKfPGSuhoJZBs7PuK1LkR8VKB0ezHX3E
         QhYN94ocvRBI6YWeqkONPOhZhPN4Urt1ofthzzl3dKAN22E+qeVFS5K6hQs3bFeIv+QA
         RWZajqpzlmWAbLQBJZ6vZRSv8wGYOtQqjRiUw0Jl5eSYhs/5MPFPtE3CMPaG6sCHphcp
         CziEZ0fIIIPw8TL4rXrmhs0vrvQFWYU4m7Ikc3ZABx4a6IDfzr23POmrndPn3CioKmx+
         JOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783737679; x=1784342479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ve+KgfwCf7WAv7Osnu4Dp5X81+V4g7CuHLm8wADOA7c=;
        b=NxLQ4xxyB8Ak4TKuZP8SnshFF152Pwaa2pWLzgWNrFQnG/va1QTA2LHntDyLd3agpm
         OYsEnhYf4Pt+Z2s5uPa4hhtwgI14hPPj/s9F/i6sIMEzOug3WbGzX5sEcPpC7DeZH52C
         N38uuzJx3Zn5143yJClctzLXa7LUnxvJgSw6c2LkwEpp0bFFRt6U5F6aD1VziAlVVsOr
         mvA5peyDfyMUXFaEX8MprdXe6uFQm1i3BGgsPaDQLczhOsVXvGDJW+mZGFJ1zTJIygjV
         AxbMvMBuJSZl+5YnhMcYe/0yQS7PKi+3MDrKPNvNA4tDuxODsZLpJ0jfWru2//oxZ91a
         jDRA==
X-Forwarded-Encrypted: i=1; AHgh+RpZKllnE6498jrsFGBVx+yKp6sYIC9owcebtEMDW8/vixIMtql7KMYwVo7xa5ES9NSrx3xcnmKGv7RG1BdMUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfQ3oNGVvdAbpnkkmtFKU14XLrNrsJTsmgA6gXEtcr8kiYC4Bq
	lWVLwdVK1sISQZPQmZspCUtzvHMdGFdJJlKHTrc6eS0xkdGmC7GmQXCcn04Yhp/+f6uVWH5YKLz
	A6vLT8HW2/VvgITgoqP4rbvkQjWZ79sU=
X-Gm-Gg: AfdE7cmyetrVUBxTSjktu/KgOPPJWO3UuBVZ03eh2flpUJoLD5EsmyYCh7oc7YIrkg2
	wPp0FDE4Ti1bdwyTNvKfpVmio52oavyDWh07VauqIUJ1edDMX6MRtMiobmQreEj9dhCdSFewrPK
	69wEzjYRb5GfgIJ3PBu5x6UexxXL1h4lOJ3WctnT3unv51mRJjOvK7lSJmrfjKITcrU9SRLBNmh
	TUEiE8i4/zJcfIQNrtgmgP0hMjqTVhV1wHh73J5+RvSBFACmOz4Wv4RCbNMXduOCSeZkTlp
X-Received: by 2002:a05:690e:43d0:b0:667:b2c3:f047 with SMTP id
 956f58d0204a3-667d7aa0516mr1048576d50.9.1783737678571; Fri, 10 Jul 2026
 19:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260710-btmtk-first-block-bool-v1-1-3602688ec523@gmail.com>
In-Reply-To: <20260710-btmtk-first-block-bool-v1-1-3602688ec523@gmail.com>
From: Miles Krause <mileskrause5200@gmail.com>
Date: Fri, 10 Jul 2026 22:41:07 -0400
X-Gm-Features: AUfX_mzQwDtg2H8ctSQPFDjQKF1EMJLy3qdwid6_YX5jZy6Z9FBBhv1W9Y4YqwM
Message-ID: <CAA6QAMJBJ11YcKKdXxuQ7MZidtta-VAw5EJd-N5_Y-tQDA0FLg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: use bool for first_block
To: mileskrause5200@gmail.com
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_194119_926468_D254BCCF 
X-CRM114-Status: GOOD (  19.06  )
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

Please disregard the duplicate submission. It was sent
unintentionally. I am sorry if I am doing anything wrong. This is one
of my first patches.

On Fri, Jul 10, 2026 at 1:16=E2=80=AFAM Miles Krause via B4 Relay
<devnull+mileskrause5200.gmail.com@kernel.org> wrote:
>
> From: Miles Krause <mileskrause5200@gmail.com>
>
> first_block is reset for each firmware section and is never used outside
> the section loop. Declare it as a bool inside the loop to limit its scope
> and make its two-state purpose explicit.
>
> No functional change.
>
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
> ---
> Compile-tested on x86_64 with:
>
>   make O=3Dout allmodconfig
>   make O=3Dout W=3D1 drivers/bluetooth/btmtk.o
>
> Sparse-tested with:
>
>   make O=3Dout-sparse allmodconfig
>   make O=3Dout-sparse C=3D1 CHECK=3Dsparse drivers/bluetooth/btmtk.o
> ---
>  drivers/bluetooth/btmtk.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 809762d64fc6..b809eb82fc73 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -63,7 +63,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, con=
st char *fwname,
>         const u8 *fw_ptr;
>         const u8 *fw_bin_ptr;
>         int err, dlen, i, status;
> -       u8 flag, first_block, retry;
> +       u8 flag, retry;
>         u32 section_num, dl_size, section_offset;
>         u8 cmd[64];
>
> @@ -79,7 +79,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, con=
st char *fwname,
>         section_num =3D le32_to_cpu(globaldesc->section_num);
>
>         for (i =3D 0; i < section_num; i++) {
> -               first_block =3D 1;
> +               bool first_block =3D true;
>                 fw_ptr =3D fw_bin_ptr;
>                 sectionmap =3D (struct btmtk_section_map *)(fw_ptr + MTK_=
FW_ROM_PATCH_HEADER_SIZE +
>                               MTK_FW_ROM_PATCH_GD_SIZE + MTK_FW_ROM_PATCH=
_SEC_MAP_SIZE * i);
> @@ -132,9 +132,9 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, c=
onst char *fwname,
>
>                         while (dl_size > 0) {
>                                 dlen =3D min_t(int, 250, dl_size);
> -                               if (first_block =3D=3D 1) {
> +                               if (first_block) {
>                                         flag =3D 1;
> -                                       first_block =3D 0;
> +                                       first_block =3D false;
>                                 } else if (dl_size - dlen <=3D 0) {
>                                         flag =3D 3;
>                                 } else {
>
> ---
> base-commit: 64b5c4c8e79c131fe8f135bab5e5dfaa245c5776
> change-id: 20260710-btmtk-first-block-bool-bd047b970821
>
> Best regards,
> --
> Miles Krause <mileskrause5200@gmail.com>
>
>

