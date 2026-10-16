Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F8FCCF2C0
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2026 18:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8qQe86RR8HXxapm056thr/pToC7ExVCLVe21t5Z5pE=; b=gAR62jb2Rw/WL2dCXnaytEVPJ3
	jr3g4CLOKajrLe2K5+4bzeH3Vt8cMN0YQvdJSBQ4gj/FXQbfZxZUp6fSH5ncGMDt2FH3y122bWRlj
	rMFQaAjcSWfWUsCwXDOzrEnm93cwyik/GJyWUHq0VYIlSSlkzhoHHB1az9ByST4ntMupY+20gSxlp
	FLwAFgEPsZSpVUWbbYYAULadbfxJ5TvQRgjUEd3Jr22aFvkidkvNE3WQmPX+Kl5rA6obDpMNU/rEX
	zt9ccS25gNz4p6pOhtK/GLDrwgCkZVZ6M4m9wrlKZh5ocYBCQNhWeSeDlelGOUNNfs79XErwENUrD
	hE0hJXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmFq-00000003cCG-0yON;
	Fri, 16 Oct 2026 18:02:06 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmFn-00000003cBA-2cI4
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Oct 2026 18:02:05 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8ac9d666d4eso2013307b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2026 11:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792173722; cv=none;
        d=google.com; s=arc-20260327;
        b=e9eE15C55z4yLsK6nhE0busV3rYLB/Z4i1OT2/0kSmHQodg2YS5s+zSMHeheaP+TFU
         G04CqNY5Son9OKD6ju/3PpGzkPwSx0ubvliHc4L7JPvb0j0/n3yBNxqqBUR+FWopeave
         fVSNzsuABX+mpJDRBJBMncPg8tOXqc3UfWrPbhe5u9jOj9aQ8iJQ4HyuYmQ5Fl/gI0BE
         WRqbBDg1fSpsGWn/Rfc6ekQRljLbPlBaDhas9WNQ2hE2DtDqvgSeCDpkRkSVv69I6jHT
         XN/Ns7M+e0/vDXXfkANmoxgdiinth/jgo17Ubhrx1IaQUrlh/ATrjEXD6YsGpO1Cz3xA
         5TGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J8qQe86RR8HXxapm056thr/pToC7ExVCLVe21t5Z5pE=;
        fh=71QZp2A3ylXMfd4tmYdRxhh+7JxcN2wCvXJAsHx6SRU=;
        b=NZIHTuoykv7tmOUdGVH24w0wkZwZRh1X90Du563ql15G0vtVskM6D3/5/ttfLnSoyZ
         wPgCR2VZ6Wdm4wDHnmoAbcrxx+MhzRQG0BLbViDUMfWkQgVkUifOgn2SwNNDZnCBXSBb
         +jYIslUBGwkrRx1oFEC7d8On8JgxIfSywnRxfAlEVRr3QHpoCKMG6pRQrUR7g4YU6NW8
         zvzqre9/P3x4AStpmkyBiuc+nznw3saI90raGgn1O95iHQ5t6t16cTj9+QnEm+PyaVR+
         Mw2YosAbFdVh5qSTxiq0KhlbCh6IzDAtp4GKbHErhSMQOnYA0LTGiiiFIKDp5ioVB/A7
         BLpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792173722; x=1792778522; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J8qQe86RR8HXxapm056thr/pToC7ExVCLVe21t5Z5pE=;
        b=qcbX0+XUhoYXdkoHG4SfLaw8NHRLppej+tzkcXDjFbmCA6dPFKLaT2eKog5ctWR3Lu
         QZBN+jkZrvu5rPc8EaXf/FFLkB7TcUJE2ZTZxSaXIELWvrdLZ9UuhU8FYSKGDEmbculW
         mDsjuoxemkhe+8m4UOWVOzlOsEGBLLcBooha4VLaEokwjAO14j4sfz7s/U/aHPMh9mVv
         lhRxoU+AOqp4ZkTyBTgRGfoqTnW6kmAu2dgyR2I/OMzQJrNFdm3lMfQvB2ay0nsghrba
         /TInc3SIFOrW7bNp93QCFo7r+CON0pEY9ywdj2QfIqAwsieGAyYAkGiXH+WMZSQ0Ua5q
         CaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173722; x=1792778522;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8qQe86RR8HXxapm056thr/pToC7ExVCLVe21t5Z5pE=;
        b=2id0Rdn1AjGJVrOftW99+vo9rLkzwOgrsuhJ+afXG3RyMwnNiWqvXPmPAIgUYukEb+
         srKXYAslhftlqmbjVIlwl/+flbdAp++rUkyszEuViT4MSgwYgpR/og6FPSmXZbhoC5Bn
         tx+DN3BjElbGnRLbudp9gsuNg5p7zD7zpq3p5bbrg5C/8SvvbBZxwxdHjaEqQX9k7b73
         dx18uawkerUE5Q4TydDT269oFcGxPewxWwAvC9wCyf9U58dMae179Hudi1rWHq0DbIiL
         yMgwtw6WG3ShdzA2a5IDDTXbUSdCd1+A3rYBY2jAEKxPGoyRG88ldQU0qAXC5Kvx2uf5
         v+VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzimkbyn81UK3CY5qc87NlI7yU/ThiXGnDzGFqj5OZPNztPUV1Jf96QtUk5bWPKUavdvatlX42cHeiIVk2Ssw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLUIJ7Gx4qrhxuZytPrY2GSXE4lirUL8tPmXftG1VPS0w4zpOAu
	WWQritQ9FL41ePEkFnZhkJ8vNO17q5pb4zysaj7/56/j9oGugsS4/0J5R0k2TS6dJFwnc4EQMLD
	WHLKFKtdupGbW/4+IcaU/efbigAg8bFc=
X-Gm-Gg: AYBFou13+CRCGuF9k02i/CfMVWB4k8DP6D1A1R89aRQ2QjpVMUqN5xKOQwPtDLjEJ49
	oKeM5sMANwUcZI9tJuI2iCpEDXTYmdDoyjO7UuUeLX90owqfMFzQP+5wLMnIQJ5pYgu8mtN6Si9
	G4YRqHAIF4W70auFjHujsLaI410cFQFqGXLCQh6mBWe2axe2ryZzXHabOKsmDVwx6CyqNbUUJU5
	1jNNpqryTB8oc2hHhL7Zay4mJuIa7Idw4yxSFLt9EsA5bCCdk7EkCgdU4rPnzu7P3SmZQbrxarl
	PlpUPQdthiFZQ1xKKN5DNTsUjOJekz8L2QIRl8yNSJYlN5kC9IkIn3x1WWtdUoPPKSkQUFBDP/3
	mq1DSlXyXfjiUld1kTFzAORBvEfGi1+R1m8/3t6g=
X-Received: by 2002:a05:690c:1c:b0:89a:63bc:8d7 with SMTP id
 00721157ae682-8b0f21f88dcmr2510727b3.97.1792173721586; Fri, 16 Oct 2026
 11:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20261016170122.27119-1-cochcoder@proton.me>
In-Reply-To: <20261016170122.27119-1-cochcoder@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 16 Oct 2026 14:01:49 -0400
X-Gm-Features: AclHuK9ZyyR23qPjum4PoTdtTN1qerXHkiUhOwDyLa83JFEN6lz1mPVQspfelRw
Message-ID: <CABBYNZ+fiAn9kNYUCVXRE1vjK_HggdVPzsA5rap5TZayqY11hg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: request LE data length for affected MT7922 firmware
To: Kyle Pepper <cochcoder@proton.me>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, 
	sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_110203_744453_795FB81F 
X-CRM114-Status: GOOD (  38.56  )
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

Hi Kyle,

On Fri, Oct 16, 2026 at 1:01=E2=80=AFPM Kyle Pepper <cochcoder@proton.me> w=
rote:
>
> On an ASUS G614PR, the MT7922 USB controller 0489:e0f6 accepts maximum
> LE suggested default data lengths, but ASHA playback remains severely
> choppy until the host sends an explicit LE Set Data Length request.
>
> With the firmware image dated 2026-07-24 14:38:15, a request on the same
> Cochlear Nucleus 8 connection produces a Data Length Change event with
> TX 251 octets/2120 us. Delivery rises from 21.5 to 50 audio SDUs/s and
> the peak outstanding packet count falls from 32 to 3. Wi-Fi power save
> remains enabled. Playback also works with the automatic request in the
> local 7.2.9 kernel build.
>
> Keep the existing suggested-default initialization and add a driver-set
> quirk for the tested USB ID, chip and firmware image only. After a
> successful remote feature exchange, queue a request using the current
> host defaults if the central-role link and controller support DLE and
> the controller advertises LE Set Data Length.
>
> Hold a connection reference while queued and recheck its membership,
> state, role and capabilities before constructing the command. Release
> the reference on completion, cancellation or queue failure. Failure of
> this optional request must not reject connection setup. Other controller
> matches, PHY fallback and suggested defaults are unchanged.
>
> Assisted-by: OpenCode:gpt-6.1-sol
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
> This is the first submission of this MediaTek-specific fix. It follows
> Luiz's suggestion, in review of a separate generic DLE RFC on October 13,
> to use a driver-set quirk if a controller needs explicit DLE. It is not
> a revision or resend of that generic request.
>
> Differences from the separate generic RFC:
> - Require the exact tested USB ID, chip and firmware image build.
> - Keep the existing suggested-default write unchanged.
> - Require a central-role link, local/peer DLE and command support.
> - Use current host defaults, not hard-coded transmit limits.
> - Keep referenced queued work, cancellation and locked revalidation.
>
> Tested on ASUS G614PR with MT7922 and a Cochlear Nucleus 8:
> - Manual same-connection request: 21.5 -> 50 SDUs/s, peak queue 32 -> 3.
> - Automatic request: local 7.2.9-arch1-2-asha-mediatek boots and playback
>   is reported working; the matching firmware and quirk log are present.
>   This local kernel/userspace stack has other ASHA patches. This is not
>   a vanilla upstream-kernel hardware test or a post-boot throughput trace=
.
> - Broader suspend/resume, battery, other-profile and native concurrency
>   coverage is not claimed. An earlier brief quality drop is not assigned
>   a cause or declared independently resolved.
>
> Validation on Bluetooth upstream base 185c11232d5f:
> - Four native Bluetooth objects compile with W=3D1 on an x86_64 diagnosti=
c
>   configuration (Rust disabled); this is not a full upstream kernel build=
.
> - 37 source-extracted ASan/UBSan controls pass, with unpatched baseline
>   and negative controls. These are not in-kernel concurrency tests.
> - Equivalent backports pass the same controls on pinned 7.2.y, 6.18.y
>   and 6.12.y snapshots. The 6.18.y and 6.12.y variants also compile the
>   four native objects with W=3D1. No older-kernel hardware boot is claime=
d.
>
> The firmware gate uses the selected image header. If setup reuses an
> already-resident image, this is not an independent read of that image's
> identity; the observed boot log matches the tested image. Please review
> this limitation before widening the match to other firmware or devices.
>
> Stable consideration: this fixes a real firmware interoperability issue,
> but the change exceeds the usual 100-line-with-context stable guideline.
> Please assess stable suitability after upstream review. No introducing
> kernel commit has been established, so no speculative Fixes tag is added.
> The 6.18.y backport uses the older connection-feature layout. The 6.12.y
> backport also uses scalar quirks and checks queued duplicates before
> taking a reference, since queue_once() there returns zero for duplicates.
> Backport application/API differences and checks are documented locally;
> no stable acceptance, older-kernel hardware test or public issue closure
> is claimed. Please do not queue an unreviewed backport directly.
>
>  drivers/bluetooth/btmtk.c        | 29 ++++++++++++++++
>  include/net/bluetooth/hci.h      |  6 ++++
>  include/net/bluetooth/hci_sync.h |  1 +
>  net/bluetooth/hci_event.c        |  8 +++++
>  net/bluetooth/hci_sync.c         | 58 ++++++++++++++++++++++++++++++++
>  5 files changed, 102 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 75483d823..cab5c4c36 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -47,6 +47,24 @@ struct btmtk_global_desc {
>         __le32 section_num;
>  } __packed;
>
> +static bool btmtk_needs_manual_dle(struct hci_dev *hdev, u32 dev_id,
> +                                  const struct btmtk_patch_header *hdr)
> +{
> +       static const u8 affected_build[16] =3D "20260724143815";
> +       struct btmtk_data *data;
> +
> +       if (hdev->bus !=3D HCI_USB || dev_id !=3D 0x7922)
> +               return false;
> +
> +       data =3D hci_get_priv(hdev);
> +       if (!data->udev)
> +               return false;
> +
> +       return le16_to_cpu(data->udev->descriptor.idVendor) =3D=3D 0x0489=
 &&
> +              le16_to_cpu(data->udev->descriptor.idProduct) =3D=3D 0xe0f=
6 &&
> +              !memcmp(hdr->datetime, affected_build, sizeof(affected_bui=
ld));
> +}
> +
>  struct btmtk_section_map {
>         __le32 sectype;
>         __le32 secoffset;
> @@ -219,6 +237,9 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, c=
onst char *fwname,
>         u32 section_num, dl_size, section_offset;
>         u8 cmd[64];
>
> +       /* Re-evaluate the firmware-specific workaround on every setup. *=
/
> +       hci_clear_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_DATA_LEN);
> +
>         err =3D request_firmware(&fw, fwname, &hdev->dev);
>         if (err < 0) {
>                 bt_dev_err(hdev, "Failed to load firmware file (%d)", err=
);
> @@ -347,6 +368,14 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, =
const char *fwname,
>         /* Wait a few moments for firmware activation done */
>         usleep_range(100000, 120000);
>
> +       /* This firmware accepts maximum suggested defaults but needs an
> +        * explicit per-link request to negotiate a larger TX data length=
.
> +        */
> +       if (btmtk_needs_manual_dle(hdev, dev_id, hdr)) {
> +               hci_set_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_DATA_LEN);
> +               bt_dev_info(hdev, "Using explicit LE data length requests=
");
> +       }
> +
>  err_release_fw:
>         release_firmware(fw);
>
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 1c992e875..513ca226d 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -340,6 +340,12 @@ enum {
>          */
>         HCI_QUIRK_BROKEN_LE_CODED,
>
> +       /* The controller needs an explicit LE Set Data Length request fo=
r
> +        * each central-role connection despite accepting suggested defau=
lts.
> +        * Set during the vendor setup callback for affected firmware onl=
y.
> +        */
> +       HCI_QUIRK_NEEDS_LE_SET_DATA_LEN,
> +
>         /*
>          * When this quirk is set, the HCI_OP_READ_ENC_KEY_SIZE command i=
s
>          * skipped during an HCI_EV_ENCRYPT_CHANGE event. This is require=
d
> diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci=
_sync.h
> index 59cb918d1..5a37d3e50 100644
> --- a/include/net/bluetooth/hci_sync.h
> +++ b/include/net/bluetooth/hci_sync.h
> @@ -194,3 +194,4 @@ int hci_le_read_remote_features(struct hci_conn *conn=
);
>
>  int hci_acl_change_pkt_type(struct hci_conn *conn, u16 pkt_type);
>  int hci_le_set_phy(struct hci_conn *conn, u8 tx_phys, u8 rx_phys);
> +int hci_le_set_data_len(struct hci_conn *conn);
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 56ad10ab9..d78f330e3 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -6875,6 +6875,14 @@ static void hci_le_remote_feat_complete_evt(struct=
 hci_dev *hdev, void *data,
>                                 conn->le_tx_def_phys &=3D ~HCI_LE_SET_PHY=
_CODED;
>                                 conn->le_rx_def_phys &=3D ~HCI_LE_SET_PHY=
_CODED;
>                         }
> +
> +                       if (hci_test_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_D=
ATA_LEN) &&
> +                           conn->role =3D=3D HCI_ROLE_MASTER &&
> +                           (hdev->commands[33] & BIT(6)) &&
> +                           (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) =
&&
> +                           (conn->le_features[0] & HCI_LE_DATA_LEN_EXT) =
&&
> +                           hdev->le_def_tx_len > 27)
> +                               hci_le_set_data_len(conn);
>                 }
>
>                 if (conn->state =3D=3D BT_CONFIG) {
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 7ac26daba..f919249e9 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -8152,3 +8152,61 @@ int hci_le_set_phy(struct hci_conn *conn, u8 tx_ph=
ys, u8 rx_phys)
>
>         return (err =3D=3D -EEXIST) ? 0 : err;
>  }
> +
> +static void le_set_data_len_complete(struct hci_dev *hdev, void *data, i=
nt err)
> +{
> +       struct hci_conn *conn =3D data;
> +
> +       bt_dev_dbg(hdev, "err %d", err);
> +       if (err && err !=3D -ECANCELED && err !=3D -ENODEV)
> +               bt_dev_warn(hdev, "Failed to set LE data length (%d)", er=
r);
> +       hci_conn_put(conn);
> +}
> +
> +static int hci_le_set_data_len_sync(struct hci_dev *hdev, void *data)
> +{
> +       struct hci_conn *conn =3D data;
> +       struct hci_cp_le_set_data_len cp;
> +
> +       hci_dev_lock(hdev);
> +
> +       if (!hci_conn_valid(hdev, conn) || conn->type !=3D LE_LINK ||
> +           conn->role !=3D HCI_ROLE_MASTER ||
> +           (conn->state !=3D BT_CONNECTED && conn->state !=3D BT_CONFIG)=
) {
> +               hci_dev_unlock(hdev);
> +               return -ECANCELED;
> +       }
> +
> +       /* Use the current suggested defaults, including later host chang=
es. */
> +       if (!hci_test_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_DATA_LEN) ||
> +           !(hdev->commands[33] & BIT(6)) ||
> +           !(hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) ||
> +           !(conn->le_features[0] & HCI_LE_DATA_LEN_EXT) ||
> +           hdev->le_def_tx_len <=3D 27) {
> +               hci_dev_unlock(hdev);
> +               return 0;
> +       }
> +
> +       cp.handle =3D cpu_to_le16(conn->handle);
> +       cp.tx_len =3D cpu_to_le16(hdev->le_def_tx_len);
> +       cp.tx_time =3D cpu_to_le16(hdev->le_def_tx_time);
> +
> +       hci_dev_unlock(hdev);
> +
> +       return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_DATA_LEN,
> +                                    sizeof(cp), &cp, HCI_CMD_TIMEOUT);
> +}
> +
> +int hci_le_set_data_len(struct hci_conn *conn)
> +{
> +       struct hci_dev *hdev =3D conn->hdev;
> +       int err;
> +
> +       err =3D hci_cmd_sync_queue_once(hdev, hci_le_set_data_len_sync,
> +                                     hci_conn_get(conn),
> +                                     le_set_data_len_complete);
> +       if (err)
> +               hci_conn_put(conn);
> +
> +       return (err =3D=3D -EEXIST) ? 0 : err;
> +}
>
> base-commit: 185c11232d5f586489bb3b74e6bcc7a6560ddd40

Perhaps before we go into the whole trouble of adding a quirk we
should check with MediaTek folks if there is a fix planned for this,
since this is actually a firmware bug. If there isn't one and a fix
would take time to be validated, I'd proceed with the quirk but I
don't think gating it on a specific build is a good idea; there might
be other firmware releases affected by this, unless MediaTek can
confirm this is exclusive to a single image in which case we should
treat it as a regression.

--=20
Luiz Augusto von Dentz

