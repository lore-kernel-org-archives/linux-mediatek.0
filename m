Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43D0EB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 22:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVQsc8+bHT3ltu3x990qHGiaeqTmQMSDyc6zm8IbuPg=; b=y8hNBnPq6URas4Zcu8Fi0+nGUr
	B+qTUms3dLBtL0WYN3W4VE13ZWr7yq6kp+vWOPSNHzaTN/IiQs/pGtF07BZ24kbQLl2Zv9AFkj8zp
	CwXokSv1unIA/tWtijRzKDbXkXq/DYWiZlX0dMOXWQRtIKTUvJP3GjiWeiZDp/5PQrC9vaQYo9ZZC
	B3y+aa9KgPip/Di2fXbkys59A2BiCm4MalDf1AxirrEIR+OKDJdNSKqvKr7eyH+tzNCQUCrOiTcNp
	P3xmPU/WTbgKuc2E8B91Rj9Dn7ZRD3UL0hQ4ZanmWxjWYdGz6+O0aQ2GtW140tUvmvkClE3Te1JmP
	patSwRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEdeu-00Gu91-2z;
	Wed, 28 Jun 2023 22:29:08 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEdeq-00Gu7I-2j
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 22:29:07 +0000
Received: from [192.168.0.2] (ip5f5aeb11.dynamic.kabel-deutschland.de [95.90.235.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A7C8E61E5FE03;
	Thu, 29 Jun 2023 00:28:16 +0200 (CEST)
Message-ID: <20b61d77-7397-e3ba-3215-232f49eb8c07@molgen.mpg.de>
Date: Thu, 29 Jun 2023 00:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3] Bluetooth: btmtk: add printing firmware information
To: Sean Wang <sean.wang@mediatek.com>, Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, jenhao.yang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mmandlik@google.com, abhishekpandit@chromium.org, mcchou@chromium.org,
 shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1c40a12b51ccd6ee2ee002276f5b1ba92c377100.1687990098.git.objelf@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <1c40a12b51ccd6ee2ee002276f5b1ba92c377100.1687990098.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_152905_059128_A2728A44 
X-CRM114-Status: GOOD (  15.84  )
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

Dear Sean, dear Chris,


Thank you for your patch.

Am 29.06.23 um 00:20 schrieb sean.wang@mediatek.com:
> From: Chris Lu <chris.lu@mediatek.com>
> 
> Add printing firmware information part when driver loading firmware that
> user can get mediatek bluetooth information.

Maybe use the commit message summary/title below:

Bluetooth: btmtk: Log hw/sw version and fw build time

Maybe also paste one log message example to the commit message.

> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
> v3: resend again with the latest tree
> ---
>   drivers/bluetooth/btmtk.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 9482401d97fa..8490d59502a5 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -57,6 +57,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
>   			      wmt_cmd_sync_func_t wmt_cmd_sync)
>   {
>   	struct btmtk_hci_wmt_params wmt_params;
> +	struct btmtk_patch_header *hdr;
>   	struct btmtk_global_desc *globaldesc = NULL;
>   	struct btmtk_section_map *sectionmap;
>   	const struct firmware *fw;
> @@ -75,9 +76,13 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
>   
>   	fw_ptr = fw->data;
>   	fw_bin_ptr = fw_ptr;
> +	hdr = (struct btmtk_patch_header *)fw_ptr;
>   	globaldesc = (struct btmtk_global_desc *)(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE);
>   	section_num = le32_to_cpu(globaldesc->section_num);
>   
> +	bt_dev_info(hdev, "HW/SW Version: 0x%04x%04x, Build Time: %s",

Why not print 0x%04x/0x%04x, that means with a slash?

> +		    le16_to_cpu(hdr->hwver), le16_to_cpu(hdr->swver), hdr->datetime);
> +
>   	for (i = 0; i < section_num; i++) {
>   		first_block = 1;
>   		fw_ptr = fw_bin_ptr;


Kind regards,

Paul

