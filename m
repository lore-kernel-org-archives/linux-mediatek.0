From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net] net: dsa: mt7530: Use NULL instead of plain integer
Date: Tue, 3 Apr 2018 10:02:40 -0700
Message-ID: <f5aa0467-8124-b097-2b89-dcf1698a5ba5@gmail.com>
References: <20180402232414.19671-1-f.fainelli@gmail.com>
 <1522721904.18424.51.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522721904.18424.51.camel@mtkswgap22>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, open list <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 04/02/2018 07:18 PM, Sean Wang wrote:
> On Mon, 2018-04-02 at 16:24 -0700, Florian Fainelli wrote:
>> We would be passing 0 instead of NULL as the rsp argument to
>> mt7530_fdb_cmd(), fix that.
>>
> 
> Acked-by: Sean Wang <sean.wang@mediatek.com>
> 
> BTW, does the part of the commit message should be updated with "passing
> NULL instead of 0"?

I don't follow you, the commit message indicates what we were doing
which implies it was wrong and fixes it. Would you want me to reword
that part?
-- 
Florian
