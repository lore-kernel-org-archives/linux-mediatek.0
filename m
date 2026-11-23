Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3C606A321
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JVx9D4zJ;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=XdBktN39
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EoUAkHlkPWrbFcfVkFGABpxquYoMskuMcC6gsYkiFA4=; b=JVx9D4zJXmCCuu
	ESqi5hjzF4qpdsNg/dCNQFVEVokVFqkb6zsSe8DeoGhZJd+TbxpWo0rCEkOqPofvyWtaHAv7NkIXz
	ASuiZycmQxcjliXtO21MiVAwa+EXIi2GWdR0NN8JmeIzqX1xB3xFFLWehPDL1beSe3fe+brx+yjjc
	f+CKxHgLU7txIoLDV1i7UQF9qv6lIFINcvOYN9PN33x6eYoArP45acvwm2pSSXcR6e+doKZg0du8s
	AVpLS6G6iXZ6yvYCserFq0okpZSIDzLOxiLw8FgWV+p3Q0N56ogk4thRl7KIOl9gvBSBtzm9WBfcP
	zfnudLO6IlIn1lKM5QBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcHM-000000053YX-3ELl;
	Mon, 23 Nov 2026 22:12:52 +0000
Received: from mail-106120.protonmail.ch ([79.135.106.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcHJ-000000053Xm-2tyi
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 22:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795471958; x=1795731158;
	bh=EoUAkHlkPWrbFcfVkFGABpxquYoMskuMcC6gsYkiFA4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XdBktN39ddyd3DFNpaloFn4CJYg6xMtGy0plg8t/oXHFD22tkQHlnYDQBYZKLD+1G
	 rKU4ZrHEi6oGTCDr7k+MHzMU/selkooRrEZLInqzE9pRQvlRvIr7/hyC3M7KpWBjk+
	 TBXbHZffomFCP4+ea7Ue58oxRUnckM1TtvBo6m1z7QMOvi19ilxP7X2mfTt1YLEZba
	 rovjJ9pYyuRwNceriP1BqYd32eD8kycQPskOLctszcAexAkb+7y06J0nq4z04xRBnN
	 VTqY5tJP2qqv9BXp/Q0i6ralp/4pNogljaNDScGOwkKmKejD1yCRHZgtAz+m8fZep4
	 Vuys/XVf2ly8A==
Date: Mon, 23 Nov 2026 22:12:33 +0000
To: linux-bluetooth@vger.kernel.org
From: Kyle Pepper <cochcoder@proton.me>
Cc: luiz.dentz@gmail.com, marcel@holtmann.org, sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Bluetooth: request LE data length for MT7922
Message-ID: <20261123221218.215154-1-cochcoder@proton.me>
In-Reply-To: <20261016170122.27119-1-cochcoder@proton.me>
References: <20261016170122.27119-1-cochcoder@proton.me>
Feedback-ID: 97716137:user:proton
X-Pm-Message-ID: 943ecc765d5ae44366246513eba7e6e3b93db50b
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_141250_385679_577D6679 
X-CRM114-Status: GOOD (  17.06  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Luiz,=20
Since there hasn't been a response from
the MediaTek folks in over 5 weeks I've gone
ahead and prepared this v2 quirk patch that=20
will work for USB MT7922 controllers.
Thanks,=20
Kyle Pepper

MT7922 USB firmware can accept maximum LE suggested default data lengths
without negotiating a larger transmit data length on a new connection.
On an ASUS G614PR with USB ID 0489:e0f6 and firmware 20260724143815,
ASHA playback remains choppy until an explicit LE Set Data Length request.
A request on the same Cochlear Nucleus 8 connection raises delivery from
21.5 to 50 audio SDUs/s and reduces peak outstanding packets from 32 to 3.

Set a quirk for MT7922 in USB setup and request the current suggested
defaults after successful remote feature exchange on central-role links.
Require local and remote DLE support and the LE Set Data Length command.
Keep suggested-default initialization and PHY negotiation unchanged.

Do not restrict the workaround to the tested firmware build or OEM USB
ID: the affected firmware range has not been confirmed. Other MediaTek
chips do not enable the quirk. The request also applies to 1M peers that
support DLE, and ordinary link-layer negotiation determines the result.

Hold a connection reference while queued and revalidate its membership,
state, role and capabilities before sending. Release the reference on
completion, cancellation or queue failure. A failed optional request
does not reject connection setup.

Assisted-by: OpenCode:gpt-6.1-sol
Assisted-by: Codex

Signed-off-by: Kyle Pepper <cochcoder@proton.me>
---
Contingency revision: MediaTek has been asked about a firmware fix and its
affected scope. No reply has been received as of November 23. This does
not establish that a firmware fix is unavailable or that every MT7922
firmware release is affected. A firmware fix remains preferable.

Changes in v2:
- Match MT7922 in USB setup, without a firmware-build or OEM USB-ID gate.
- Remove firmware-header matching and its setup-time clear/recheck logic.
- Rebase on current bluetooth-next; retain guarded referenced queue work.

Previous patch:
https://lore.kernel.org/linux-bluetooth/20261016170122.27119-1-cochcoder@pr=
oton.me/
Luiz requested checking firmware-fix plans and avoiding a single-build
gate unless MediaTek confirms an image-specific regression. This v2 is
prepared in case a validated firmware fix is not forthcoming; his reply
is conditional guidance, not an Acked-by or approval of this revision.

Historical evidence: manual same-link request on 0489:e0f6 with firmware
20260724143815 gave 21.5 -> 50 SDUs/s. Automatic requests worked in the
local patched 7.2.9 stack. No new hardware result is claimed for v2, for
other firmware/OEM boards, or for vanilla upstream. Suspend/resume,
other profiles, native concurrency and power regressions remain untested.

Local validation on base ffb95458a0f7: GCC and Clang baseline/candidate
builds each compile four Bluetooth objects with W=3D1 and zero warnings.
82 source-extracted ASan/UBSan controls pass; the baseline and five
mutation controls detect missing behavior and guards. LeakSanitizer is
disabled because the command runner uses ptrace; these are model tests.
Source-only strict checkpatch is clean. Stock full-mail checkpatch flags
the retained Assisted-by trailers as BAD_SIGN_OFF. No checker is changed
or attribution removed; remote CI and human-signed mail remain unchecked.

No introducing kernel commit has been established for this firmware bug,
so no Fixes or stable tag is inferred. No extra patch/MR dependency.
Human review and DCO sign-off are required before publication.

AI assistance: the retained request/queue implementation originated with
OpenCode:gpt-6.1-sol. Codex adapted matching, rebased it, and prepared this
message, review notes and offline validation in response to Luiz's review.

 drivers/bluetooth/btmtk.c        |  4 +++
 include/net/bluetooth/hci.h      |  5 +++
 include/net/bluetooth/hci_sync.h |  1 +
 net/bluetooth/hci_event.c        |  8 +++++
 net/bluetooth/hci_sync.c         | 58 ++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 1b3dab0d1..1869815cc 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1858,6 +1858,10 @@ int btmtk_usb_setup(struct hci_dev *hdev)
=20
 =09btmtk_data->dev_id =3D dev_id;
=20
+=09/* MT7922 needs per-link requests despite suggested defaults. */
+=09if (dev_id =3D=3D 0x7922)
+=09=09hci_set_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_DATA_LEN);
+
 =09err =3D btmtk_register_coredump(hdev, btmtk_data->drv_name, fw_version)=
;
 =09if (err < 0)
 =09=09bt_dev_err(hdev, "Failed to register coredump (%d)", err);
diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index efb85c781..85a4931e5 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -348,6 +348,11 @@ enum {
 =09 */
 =09HCI_QUIRK_BROKEN_READ_ENC_KEY_SIZE,
=20
+=09/* The controller needs an explicit LE Set Data Length request for
+=09 * each central-role connection despite accepting suggested defaults.
+=09 */
+=09HCI_QUIRK_NEEDS_LE_SET_DATA_LEN,
+
 =09/*
 =09 * When this quirk is set, the reserved bits of Primary/Secondary_PHY
 =09 * inside the LE Extended Advertising Report events are discarded.
diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_s=
ync.h
index 509ec4161..eab827dfa 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -195,6 +195,7 @@ int hci_le_read_remote_features(struct hci_conn *conn);
=20
 int hci_acl_change_pkt_type(struct hci_conn *conn, u16 pkt_type);
 int hci_le_set_phy(struct hci_conn *conn, u8 tx_phys, u8 rx_phys, u16 phy_=
opts);
+int hci_le_set_data_len(struct hci_conn *conn);
 int hci_le_set_cig_params_sync(struct hci_dev *hdev, u8 cig_id);
 int hci_le_create_big_sync(struct hci_conn *conn, struct bt_iso_qos_ext *q=
os,
 =09=09=09   u8 num_bis);
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index b6c7f9a9f..7ef2c4d19 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -7436,6 +7436,14 @@ static void hci_le_remote_feat_complete_evt(struct h=
ci_dev *hdev, void *data,
 =09=09=09 */
 =09=09=09conn->le_tx_def_phys &=3D ~HCI_LE_SET_PHY_HDT;
 =09=09=09conn->le_rx_def_phys &=3D ~HCI_LE_SET_PHY_HDT;
+
+=09=09=09if (hci_test_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_DATA_LEN) &&
+=09=09=09    conn->role =3D=3D HCI_ROLE_MASTER &&
+=09=09=09    (hdev->commands[33] & BIT(6)) &&
+=09=09=09    (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) &&
+=09=09=09    (conn->le_features[0] & HCI_LE_DATA_LEN_EXT) &&
+=09=09=09    hdev->le_def_tx_len > 27)
+=09=09=09=09hci_le_set_data_len(conn);
 =09=09}
=20
 =09=09if (conn->state =3D=3D BT_CONFIG) {
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 2e88af51b..ac82aa085 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -9286,3 +9286,61 @@ int hci_le_eks_oppt_encrypt(struct hci_conn *conn)
=20
 =09return err;
 }
+
+static void le_set_data_len_complete(struct hci_dev *hdev, void *data, int=
 err)
+{
+=09struct hci_conn *conn =3D data;
+
+=09bt_dev_dbg(hdev, "err %d", err);
+=09if (err && err !=3D -ECANCELED && err !=3D -ENODEV)
+=09=09bt_dev_warn(hdev, "Failed to set LE data length (%d)", err);
+=09hci_conn_put(conn);
+}
+
+static int hci_le_set_data_len_sync(struct hci_dev *hdev, void *data)
+{
+=09struct hci_conn *conn =3D data;
+=09struct hci_cp_le_set_data_len cp;
+
+=09hci_dev_lock(hdev);
+
+=09if (!hci_conn_valid(hdev, conn) || conn->type !=3D LE_LINK ||
+=09    conn->role !=3D HCI_ROLE_MASTER ||
+=09    (conn->state !=3D BT_CONNECTED && conn->state !=3D BT_CONFIG)) {
+=09=09hci_dev_unlock(hdev);
+=09=09return -ECANCELED;
+=09}
+
+=09/* Use the current suggested defaults, including later host changes. */
+=09if (!hci_test_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_DATA_LEN) ||
+=09    !(hdev->commands[33] & BIT(6)) ||
+=09    !(hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) ||
+=09    !(conn->le_features[0] & HCI_LE_DATA_LEN_EXT) ||
+=09    hdev->le_def_tx_len <=3D 27) {
+=09=09hci_dev_unlock(hdev);
+=09=09return 0;
+=09}
+
+=09cp.handle =3D cpu_to_le16(conn->handle);
+=09cp.tx_len =3D cpu_to_le16(hdev->le_def_tx_len);
+=09cp.tx_time =3D cpu_to_le16(hdev->le_def_tx_time);
+
+=09hci_dev_unlock(hdev);
+
+=09return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_DATA_LEN,
+=09=09=09=09     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+int hci_le_set_data_len(struct hci_conn *conn)
+{
+=09struct hci_dev *hdev =3D conn->hdev;
+=09int err;
+
+=09err =3D hci_cmd_sync_queue_once(hdev, hci_le_set_data_len_sync,
+=09=09=09=09      hci_conn_get(conn),
+=09=09=09=09      le_set_data_len_complete);
+=09if (err)
+=09=09hci_conn_put(conn);
+
+=09return (err =3D=3D -EEXIST) ? 0 : err;
+}

base-commit: ffb95458a0f70dcab620eee0ecf5ef7750971b2f


