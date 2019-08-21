From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 0/3] net: dsa: mt7530: Convert to PHYLINK and
 add support for port 5
Date: Wed, 21 Aug 2019 23:05:28 +0200
Message-ID: <20190821210528.GA29618@lunn.ch>
References: <20190821144547.15113-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190821144547.15113-1-opensource@vdorst.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-mips@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Aug 21, 2019 at 04:45:44PM +0200, Ren=E9 van Dorst wrote:
> 1. net: dsa: mt7530: Convert to PHYLINK API
>    This patch converts mt7530 to PHYLINK API.
> 2. dt-bindings: net: dsa: mt7530: Add support for port 5
> 3. net: dsa: mt7530: Add support for port 5
>    These 2 patches adding support for port 5 of the switch.
> =

> v1->v2:
>  * Mostly phylink improvements after review.

Hi Ren=E9

You are addressing comments mostly from Russell King. It would of been
good to Cc: him on the patchset.

Andrew
