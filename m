Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C32606A330
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=raVsEu5c;
	dkim=pass (1024-bit key, unprotected) header.d=ik.me header.i=@ik.me header.a=rsa-sha256 header.s=20200325 header.b=fH5rKRN/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EDBgPC6ITb9J3xFq1ovAYMVyfTW39nSEsNOx9gLCCDg=; b=raVsEu5c3VCFzhM/LiQGwqfVW2
	smd5Z9KH7QoBkCoFDaO3qMO5FX2U38ovtFvd0SG/qm5kHE8MgUQfKeAs2LBGesKnw1HR4VSzvSeke
	T5JzjzEC3AjToeqF0yucAjUxhH7+wz0VYeI+O78+JGSIViox952HSGZVpyhY6zhLFcgkoSpndB+HW
	l5s1453yqoOJ0YB6qUA0VixPtbG2HW4/7M8xz3UR0VzASk3xeH0EJodloozC3z40UGw1GCQDrCxzs
	CpPhzVYclUiVQvYi4yX6ho+b2N4Y6W7R6s14iqujMz/lBtjHnn7m1q7qVUvt/rLwd25Sxro9OVIbI
	DLwbfGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEIR-0000000GEen-2BZ3;
	Sat, 14 Nov 2026 13:59:59 +0000
Received: from smtp-8faf.mail.infomaniak.ch ([83.166.143.175])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEIN-0000000GEeS-3Kb2
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 13:59:57 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jRbNS2jtzzb7k;
	Sat, 14 Nov 2026 14:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1794664792; bh=EDBgPC6ITb9J3xFq1ovAYMVyfTW39nSEsNOx9gLCCDg=;
	h=From:To:Cc:Subject:Date:From;
	b=fH5rKRN/77oBAsGNmm8YIFASYv4WCFB2Ik9PzuMiJ42TV+UCKcCcqlESQj8mkUd79
	 f0Z0vtSzklOH6OD7uEtGBgE6QP+z3rwxQKZxxOBIgYeMwoTSzHwfjEk6r8+6dblaIU
	 di9xpnCod+YuFBdPCfGEPNfxbDTWlnDFbCcJJMro=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jRbNR2pNCzSZ3;
	Sat, 14 Nov 2026 14:59:51 +0100 (CET)
From: Selim Awn <selimawn@ik.me>
To: yunfei.dong@mediatek.com, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org
Subject: MT8189 SCP firmware: single-core HEVC INIT clears 256 KiB past
 h265_dec_srv_param and crashes the SCP
Date: Sat, 14 Nov 2026 14:59:51 +0100
Message-ID: <179466479105.70915.3582435008101380821@ik.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Feedback-ID: :b7a7c7c8b482037:ham:b366ec3b20c1372
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_055956_136119_867E2AAE 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On MT8189 (ASUS Chromebook "Tarkin"), opening a stateless HEVC decoder
crashes the SCP every time. I believe this is a bug in the SCP
firmware.

Setup:
- Kernel: chromeos-6.6 based, 6.6.147, mtk-vcodec-dec stateless,
mtk_vdec_single_core_pdata (MTK_VDEC_PURE_SINGLE_CORE)
- Firmware: linux-firmware mediatek/mt8189/scp.img, "9a0dfa3 Aug 4
2025", sha256
7b1d56bfe34db620be411e72a56b5bdc981e88fce5664b73a5d270ae9d821f23
- The ChromeOS SCP image "e3c0782 Jan 30 2026" has the same code and
constants, so it should be affected too (checked by disassembly only)

Symptom: the AP_IPIMSG_DEC_INIT (0xA000) for 'S265' on IPI 14 is never
acked. "SCP watchdog timeout! 0x0" fires within milliseconds, then
"scp ipi 14 ack time out" appears and remoteproc reloads scp.img.

Cause, from the firmware's symbols/DWARF (vdec_h265_sig_srv.c,
vdec_com_h265.c, vdec_h265_psr.c):
- h265_dec_srv_param is at 0x73d6b8, size 0x221398, ending at
0x95ea50.
- INIT places the instance at offset 0xfc30 (0x74d2e8).
h265_init_instance_ctx() puts three areas after it, back to back: the
instance (0x2558), buf1 at 0x74f840 (0x20f210, ending exactly at
0x95ea50) and buf2 at 0x95ea80.
- vdec_h265_init_rom() then does memset(buf2, 0, 0x3fff0), up to
0x99ea70. This clears hw_param, hal_param, default_frame_context_bin,
dcq/acq_lookup, h264_dec_param, h264_comhal_bsops, venc_vsi,
venc_drv_inst, venc_h264_func, the venc RC/reference tables, and then
runs past __dram_end (0x98b000).
- In short, the object is 0x40000 bytes too small for its own layout.

How I verified it (read-only on the firmware side):
1. Set remoteproc recovery to disabled.
2. Sent one HEVC INIT.
3. After the crash, read the SCP DRAM (phys 0x50000000 =3D SCP 0x700000)
through /dev/mem.
4. Set recovery back to enabled.
Result: the buf2 pointer was 0x95ea80, and default_frame_context_bin,
dcq_lookup, h264_comhal_bsops and venc_h264_func were all zero (they
were non-zero before).

To reproduce: on an unpatched kernel, open an HEVC_SLICE context on
the decoder node, e.g. ffmpeg -hwaccel vaapi with libva-v4l2_request
on any HEVC clip.

Kernel side: vdec_hevc_req_multi_if only implements LAT + core, and
its decode() rejects MTK_VDEC_PURE_SINGLE_CORE, in chromeos-6.6 and in
mainline. The format is still offered because the firmware sets
MTK_VDEC_FORMAT_HEVC_FRAME (dec_capability 0xc1520). Locally I now
skip HEVC_SLICE on pure single core and return -EOPNOTSUPP in
vdec_hevc_slice_init() before any IPI is sent. I can post that if it
is useful.

Questions:
1. Can you confirm the overrun and fix the firmware (grow
h265_dec_srv_param or move buf2)?
2. Is single-core HEVC (vdec_h265_sig_srv) meant to be supported on
MT8189? If so, is a kernel single-core backend planned, or what
VSI/IPI flow should it follow? If not, should the firmware stop
setting the HEVC capability bit?
3. Can you confirm that the MT8189 SCP firmware has no AV1 decoder?
vdec_msg_handler only dispatches VP9F/S265/S264, and the AV1
capability bit (0x800) is not set.

Thanks,
Selim

