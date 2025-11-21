Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB0DCFA474
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 05:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Zs9GRvm32PNjZzoA8qlvAE406gaQ36xltOhqAM2veQ=; b=sHuadhkC0S4n+w3CnbKk4aLLxc
	vfn1+btA2Lp5Afx+wgdQjgpuPETlUoylhRtNfw+mBpQ0OsIHwSZ9IACl9XewCTGqQTeDCiRmRsAzX
	Dv6SYgoFDWSahU7LkoAkyjA0TTCRn1JN+9s9NaqrY97AEbOT5vb5ObrvepAC4z5mDcVE2/lLZIEg2
	FELDpapuBIhoO/aombv8HCHXYhIpmns+LRIu8yXL3aQR2Dboy+OcxU+M7oFFZCTC+CpH2/XMfhHjH
	9sqnvGistOgVc9kye5QRjq445HMN3bk2GRPoR/tRq2CfRwuub0PUgFvgyQfMSks3oVYtgk8iSM58+
	s3F+3H3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJug-00000007rGR-29uR;
	Fri, 21 Nov 2025 05:42:30 +0000
Received: from p-west1-cluster2-host1-snip4-10.eps.apple.com ([57.103.64.181] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJud-00000007rG2-3qeS
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 05:42:29 +0000
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-11 (Postfix) with ESMTPS id E8497180014E;
	Fri, 21 Nov 2025 05:42:20 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; bh=4Zs9GRvm32PNjZzoA8qlvAE406gaQ36xltOhqAM2veQ=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=Ccd7hTV2ROk7BDrGaaCgAkdal7/2NvRZPmuB6pZRomMoX+gklQEmhrqkTpo5tH67Tolqh8wKIIvWutj21AMzr/DVWryE1n6itXLBtEd3b9NGVEKB+uA3drYh4roAYmGWzqiKOMtBNzpH2q4cBju4GO7LcuiPhr2lvI98JYoWZ2W+7f73su6xbQpx2+lfs1yL3SWJP+cpjI1ZxzUTEKpJytV4dmdVeoIBHcl5ECuYJge0cGKOlJPDkzUEolqiMpEoi3ASGr1Vj7k1MhOuemZ2ofnxF8ju+KdY1qKPZlA8Ocrk1LsAmnz78xK1o9z4ZJ7ClV0vu2LDjPFlCntziqX/BA==
Received: from [172.31.0.10] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-11 (Postfix) with ESMTPSA id EA4A218000A0;
	Fri, 21 Nov 2025 05:42:19 +0000 (UTC)
Message-ID: <780b6778-ea0e-4fc9-8f35-83b5cd4940af@icloud.com>
Date: Thu, 20 Nov 2025 21:42:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mt76 1/2] Revert "wifi: mt76: mt792x: improve monitor
 interface handling"
To: Fedor Pchelkin <pchelkin@ispras.ru>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matvey Kovalev
 <matvey.kovalev@ispras.ru>, lvc-project@linuxtesting.org
References: <20251027111843.38975-1-pchelkin@ispras.ru>
Content-Language: en-US
From: Alex Gavin <a_gavin@icloud.com>
In-Reply-To: <20251027111843.38975-1-pchelkin@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Info: v=2.4 cv=T/2BjvKQ c=1 sm=1 tr=0 ts=691ffbbe cx=c_apl:c_pps
 a=azHRBMxVc17uSn+fyuI/eg==:117 a=azHRBMxVc17uSn+fyuI/eg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=x7bEGLp0ZPQA:10 a=h3XwevFeXowA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=HH5vDtPzAAAA:8 a=xjQjg--fAAAA:8
 a=NfBt78jllEJdnomDNvIA:9 a=QEXdDO2ut3YA:10 a=QM_-zKB-Ew0MsOlNKMB5:22
 a=L4vkcYpMSA5nFlNZ2tk3:22
X-Proofpoint-ORIG-GUID: xqec2kQ6ReU-W5E9VoidnOuMpYXd7nHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA0MyBTYWx0ZWRfX/QhFid0JZdY6
 L0yfZxQEOV74tRAzQEamz3rlbMCh7yMr2i+vNLSnvgfnTJREd0y9RiLKrCk8ZlSkFXq/TfWWxRs
 bBkLLUTMx1NlgCQuhyWVQ9axj/0kBSFmeiYKHiMY/RI8KgBYac8bF6zjUjEM903FPqG1FAYkEiB
 iYp7YNU21gcGtw7j6wROw+nEJDlNfPGSJmgMJvJTtNmWeuKI9zt+IEykbUDf5Dce8hAiDsTHffi
 d1KJBOkvlHCDSGXyXgAIst66nTlhIbQWiEZ2YqQClECKTvXDeF7AeUEathI+pQ1dW/Ux+E0pEi8
 7ytEfPQp9ffmc8nG4za
X-Proofpoint-GUID: xqec2kQ6ReU-W5E9VoidnOuMpYXd7nHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210043
X-JNJ: AAAAAAABmYUlTjxPqxU886FK+jlSf8uaaEDanEEde9JRREjw0e6s1eg9FZO29EPN29zZoyP2kjex7XdZaGP/k5G7Fkm2AYqAr9vAn2k1TWTlS6etMEf1c+A+Jvf7n3gCdX3PIPHQsoWt+qeuwY286Shy+LNqpTDqHsY8qQhDpG1tIidxfbrXZLbvta5PFX86mKl/qkf+FREgRPTWLQG7roYOagcbvWCsTnvnlqNnCr3+d5DHLXFjBkR5EEfWUbJZnxDBvGV6BtlrxxQbx5weNwwQda0NyQylK3gGt+Sj1HuaxFK9GOm6cCaEc4wjR857/JqLPOQ6TGIgzzvH8UAPbqK8fJ78/QwgOGrPqc9oGusWoRd9T0woQB6wxvQP5r4yMmL4m4MvcFgP00/4xMVnOVVz12p6Bem4NT4dVTEYnpXEw6Um1Q52xJ9fJ3dE7fijGbXFyxDpVbBz9OskwvSKw/db01+t0vm0y5N8UIEt5zb+5caxBuFXbpOygdR/SxR4fPnMdBiQKafJcUWsbkVP5JRBPYWnPXt7r9we3oEHktvFTLSRfHkzo6lfHtR93PUfg2Pc/UW2pJk7CpjfG3WTWDYeWa8t8xvBALqh3B+CcoqK3cgyFdbCCIEc8vizSJVcucVn5ggCfS3Sd+AWWnQ3R2ajn4AmclFEIEZLye9GzJuGXA8NAnwl2gWDgFA3YNbiMHq4zvs0vqdvwBPI3rDxvmCExew4Sc3tNxY4Q6/xFRK/HcUrXq2QC0645NfGrrqbl/DvRu1Bxdc2ZUYY2jZNEw9gO9KvANRFjqLNbwckDXfyyy/Ec+HgSs2t3njFXtzijtxSLAk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_214227_981067_B3AF927A 
X-CRM114-Status: GOOD (  16.80  )
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

On 10/27/25 04:18, Fedor Pchelkin wrote:
> This reverts commit 55e95ce469d0c61041bae48b2ebb7fcbf6d1ba7f.
> 
> mt792x drivers don't seem to support multi-radio devices yet.  At least
> they don't mess with `struct wiphy_radio` at the moment.
> 
> Packet capturing on monitor interface doesn't work after the blamed patch:
> 
>   tcpdump -i wls6mon -n -vvv
> 
> Revert the NO_VIRTUAL_MONITOR feature for now to resolve the issue.
> 
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: 55e95ce469d0 ("wifi: mt76: mt792x: improve monitor interface handling")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
> 
> Can't answer exactly *why* the capturing doesn't work after the patch:
> probably because the driver is just not prepared for NO_VIRTUAL_MONITOR.
> The feature isn't too obvious, especially that for some reason it was set
> in mt792x alongside WANT_MONITOR_VIF.  With a quick glance I might
> conclude that NO_VIRTUAL_MONITOR overrides WANT_MONITOR_VIF, they don't
> look compatible.
> 
>  drivers/net/wireless/mediatek/mt76/mt792x_core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> index 5b50bf94996e..f2ed16feb6c1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> @@ -688,7 +688,6 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
>  	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
>  	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
>  	ieee80211_hw_set(hw, CONNECTION_MONITOR);
> -	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
>  	ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
>  	ieee80211_hw_set(hw, SUPPORTS_ONLY_HE_MULTI_BSSID);
>  

This patch fixed monitor vif-only packet capture for me when using both mt7921 and mt7921au chipset
radios. Without it I was only seeing broadcast and multicast traffic I believe. Tested using vanilla
6.18.0-rc6 as base.


