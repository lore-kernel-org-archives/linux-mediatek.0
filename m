Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DCAF89254
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=13ZWL/eHlUY5OOB6+y7Y+vPu0LaU5nOnT6pQcRP3ud4=; b=mAe81L1tYAi7rtHJCoY5gPLX0D
	/gZkvXSwtc67YaTD2hVDz+5xKkS1ECuJJBBRpYwzva0bfx3IrkasycMwEfkYWPdrHKyFa5farr8j4
	H4wb+e7UrEIWOb9Wg7sm5KJvuMNNLzIvafnJ80vw68DXJbXUG7w1lsiwwsBrqFwk878qrPPfQ4j35
	pGPMjI8SZmGGsHopXVdu7b4qJGxd1+p9WKzl9yh9S27nv9WKoIRYUqje/uQ2mDhARH1nnbATIj2sr
	Zi67po48w4krW+3vRne2zhy591FqI2xGtUZU7Y4kvulAAQ+NeVG4ZmMEDAs3un97+beeKbDFJH84o
	AcgctrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8WL-00000008SFM-1wrg;
	Tue, 21 Apr 2026 10:39:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8WJ-00000008SF0-1GOP
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 10:39:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so65180895e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2026 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776767993; x=1777372793; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13ZWL/eHlUY5OOB6+y7Y+vPu0LaU5nOnT6pQcRP3ud4=;
        b=ixsvG2YWpic+PF3kqGXbrdvI0126PctJuJZBn04mSou4rLDtSsc2xZXhpZatqoT8m1
         T0euy2AXGwaChbYRy/d40PeBQpzCgEZWV05g56fUfa3YCdnLpFlHA4Pw99PM7oDNNvAq
         9J5OlnOR5mxX/Ao//zAe1AqG83jf4IZSkIfoDIKgRfZ2sFFHOK4rCmsrKowRfk1phAT7
         BH/PmTs5EpzFmS7oxWDIkdgTcTANbXm6kIHsFfMenUQUZRcITUT6vGVbJQ+JEja5oIPY
         Jx2spaA+IS96PuIpwIo0WScDq4jrfSEwmfgk03GUuBPAFi/fDLiC88qa4mNSFY/IZVAl
         PaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767993; x=1777372793;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13ZWL/eHlUY5OOB6+y7Y+vPu0LaU5nOnT6pQcRP3ud4=;
        b=Kh3Ju/yVKXts2duDNyOVevKc21UZJd9FNEvloU3jG03vx5wtKW1xvaAZaqzAHQKbKQ
         8jr1wavfY3eF/6Hu47Ji260rU3NCKnR/09qDfoDghnYM5CaTi8MBsbUiODzduxpOC0mc
         AOBaR1jm+tYu0v0fB7etUbq7lxivUUaqcXpBjiG6XqMo6DHr1dPgUUXMuNgbgOLVpxa9
         7InLiraSRyyMNsLoUX3ca6mPbhwBRxxnlhtuH5p28uSEAQz8IAOtUqCJINc6A7LQHe1I
         atfHBsOUywvfR7umKAO61kxEtHxokCJCPvecOe5ek6mg1GhnOHIKwK8sVpeJLB6m6u+u
         Ty+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+YUz0A8K03aoAt8gDB/d7L305UHNfiwmGOiJJQDNg9a6vdBYkKDYezB7C6+wt/slidCGH9IvNYDap2Eyz3tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCdaB4dMRTjdT0JeUYRbRGDHMNaFNM+t2wY4qWrEr14u3Yv0tF
	TE/H3Qj4epyMu/V9m9Qdi/FunBGHRJsI0qeRQ2V/bsbfBKbrP56/CMA=
X-Gm-Gg: AeBDietkRxep3S0rwxe5DWf6aSYs+FS1rYDoWR/ACO5tYxcDPpBMb1LDR0axTJoH1oK
	/JUp659fCYvR3lZS68ERQk90uQcL8SBpmIIl4wZMa28jY5cW/lIpE81xiZoJ7n0Tt4Gl/FWvXuW
	I8a1NnmT2wbWC4Am2EmI1e+LjWinc90w+4BZDlPrBnkCawGrChqnYaBCDu6HJeE1lbIL0K/hZuB
	Q7N2ZMF+poTap4F4BY6DyEwOwOOzmqJkDnE64vsS0NJKz5W7YMppXTiyPjDLhZ9G9EmtgqNh+kS
	KD3QN/CpMOjpLkI+J3cwTfQgwru64PRpITiVbuntQg3dH3cSciY1lN7mKSIlDCmAmalBwSsZ07T
	R6UZehZBrzY33hJabNqvyJZ7kp2JGbhPlglnjFQsPsT6lAvrK2R0/4NhtamwN1qMet4/0hAKf5M
	uVrxODEFN/BRM=
X-Received: by 2002:a05:6000:2c0b:b0:439:beb9:5a96 with SMTP id ffacd0b85a97d-43fe3dfbff5mr27427886f8f.31.1776767992844;
        Tue, 21 Apr 2026 03:39:52 -0700 (PDT)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a79esm38619383f8f.17.2026.04.21.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:39:52 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Chen <mark-yw.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [PATCH v4] Bluetooth: btmtk: validate WMT event SKB length before
 struct access
Date: Tue, 21 Apr 2026 10:39:51 -0000
Message-ID: <177676799168.2227510.2141901333230538239@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_033955_357564_BB146D38 
X-CRM114-Status: GOOD (  13.43  )
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

On Mon, 20 Apr 2026, Luiz Augusto von Dentz wrote:
> Can't we just use skb_pull_data instead?

Good call -- much cleaner. v4 below uses skb_pull_data for the initial
struct access and a follow-up pull for the FUNC_CTRL status field.

skb_pull_data(evt_skb, sizeof(*wmt_evt)) validates + returns a pointer
to the 7-byte wmt_evt before advancing. For the FUNC_CTRL case, we
pull the extra sizeof(__be16) to validate the status field is present,
and read it via the original wmt_evt pointer cast to wmt_evt_funcc
(which embeds wmt_evt as its first member).

---

From: Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v4] Bluetooth: btmtk: validate WMT event SKB length before st=
ruct access

btmtk_usb_hci_wmt_sync() casts the WMT event response SKB data to
struct btmtk_hci_wmt_evt (7 bytes) and struct btmtk_hci_wmt_evt_funcc
(9 bytes) without first checking that the SKB contains enough data.
A short firmware response causes out-of-bounds reads from SKB tailroom.

Use skb_pull_data() to validate and advance past the base WMT event
header. For the FUNC_CTRL case, pull the additional status field bytes
before accessing them.

Fixes: d019930b0049 ("Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.=
c")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v4:
  - Use skb_pull_data() instead of manual length checks, per
    Luiz Augusto von Dentz.

 drivers/bluetooth/btmtk.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 6fb6ca274..XXXXXXX 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -695,8 +695,13 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 	if (data->evt_skb =3D=3D NULL)
 		goto err_free_wc;

-	/* Parse and handle the return WMT event */
-	wmt_evt =3D (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
+	wmt_evt =3D skb_pull_data(data->evt_skb, sizeof(*wmt_evt));
+	if (!wmt_evt) {
+		bt_dev_err(hdev, "WMT event too short (%u bytes)",
+			   data->evt_skb->len);
+		err =3D -EINVAL;
+		goto err_free_skb;
+	}
+
 	if (wmt_evt->whdr.op !=3D hdr->op) {
 		bt_dev_err(hdev, "Wrong op received %d expected %d",
 			   wmt_evt->whdr.op, hdr->op);
@@ -712,7 +717,13 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 		status =3D BTMTK_WMT_PATCH_DONE;
 		break;
 	case BTMTK_WMT_FUNC_CTRL:
-		wmt_evt_funcc =3D (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
+		if (!skb_pull_data(data->evt_skb,
+				   sizeof(wmt_evt_funcc->status))) {
+			err =3D -EINVAL;
+			goto err_free_skb;
+		}
+
+		wmt_evt_funcc =3D (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
 		if (be16_to_cpu(wmt_evt_funcc->status) =3D=3D 0x404)
 			status =3D BTMTK_WMT_ON_DONE;
 		else if (be16_to_cpu(wmt_evt_funcc->status) =3D=3D 0x420)
--
2.47.3

